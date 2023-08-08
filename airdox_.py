from beet import Context, TextFile, ResourcePack, DataPack, JsonFile
from copy import deepcopy
from pathlib import PurePath
from beet.contrib.model_merging import model_merging
import os
import json
import requests

@property
def modified_suffixes(self):
    """
    A list of the final component's suffixes, if any.

    These include the leading periods. For example: ['.tar', '.gz']
    """    
    name = self.name
    if name==".mcfunction":
        return [name]
    else:
        if name.endswith('.'):
            return []
        name = name.lstrip('.')    
        return ['.' + suffix for suffix in name.split('.')[1:]]


def allow_function_without_name(ctx: Context):
    PurePath.suffixes = modified_suffixes

                





        

def add_license(ctx: Context):
    "Injecting LICENSE"
    path_to_license=ctx.meta["airdox_"]["license_path"]
    #take the file name from the path
    file_name=path_to_license.split("/")[-1]
    ctx.data.extra[file_name]=TextFile(open(path_to_license).read())
def add_readme(ctx: Context):
    "Injecting README"
    path_to_readme=ctx.meta["airdox_"]["readme_path"]
    #take the file name from the path
    file_name=path_to_readme.split("/")[-1]
    ctx.data.extra[file_name]=TextFile(open(path_to_readme).read())



def delete_load_tag_and_packpng(ctx: Context):
    if "load:load" in ctx.data.function_tags:
        del ctx.data.function_tags["load:load"]
    if "pack.png" in ctx.data.extra:
        del ctx.data.extra["pack.png"]
    if "pack.png" in ctx.assets.extra:
        del ctx.assets.extra["pack.png"]



def test_load_generator(ctx: Context):
    "Injecting test_load"


    dep_check="""scoreboard players set #{project_id}.{dep_id} load.status 0
# {dep_name} version are ^major.minor.patch
scoreboard players set #{project_id}.{dep_id}.major load.status {dep_major}
scoreboard players set #{project_id}.{dep_id}.minor load.status {dep_minor}
scoreboard players set #{project_id}.{dep_id}.patch load.status {dep_patch}

execute if score {dep_prefix}.major load.status = #{project_id}.{dep_id}.major load.status if score {dep_prefix}.minor load.status = #{project_id}.{dep_id}.minor load.status if score {dep_prefix}.patch load.status >= #{project_id}.{dep_id}.patch load.status run scoreboard players set #{project_id}.{dep_id} load.status 1

execute unless score #{project_id}.{dep_id} load.status matches 1 run tellraw @a [{{"translate":"simpledrawer.tellraw_prefix","color":"dark_red"}},{{"text":"Error Loading {project_name}, {dep_name} v","color":"red"}},{{"score":{{"name":"#{project_id}.{dep_id}.major","objective":"load.status"}},"color":"red"}},{{"text":".","color":"red"}},{{"score":{{"name":"#{project_id}.{dep_id}.minor","objective":"load.status"}},"color":"red"}},{{"text":".","color":"red"}},{{"score":{{"name":"#{project_id}.{dep_id}.patch","objective":"load.status"}},"color":"red"}},{{"text":"+ is required but the installed version is v","color":"red"}},{{"score":{{"name":"{dep_prefix}.major","objective":"load.status"}},"color":"red"}},{{"text":".","color":"red"}},{{"score":{{"name":"{dep_prefix}.minor","objective":"load.status"}},"color":"red"}},{{"text":".","color":"red"}},{{"score":{{"name":"{dep_prefix}.patch","objective":"load.status"}},"color":"red"}}]


"""
    function=""
    final_test="execute "

    for dep in ctx.meta["smithed_dependencies"]:
        if dep["versioning"]["type"]=="normal":
            major,minor,patch=dep["version_"].split(".")
            function=function+dep_check.format(project_id=ctx.project_id,dep_id=dep["id"],dep_name=dep["id"],dep_major=major,dep_minor=minor,dep_patch=patch,dep_prefix=dep["versioning"]["prefix"],project_name=ctx.project_name)

            final_test=final_test+"if score #{project_id}.{dep_id} load.status matches 1 ".format(project_id=ctx.project_id,dep_id=dep["id"])

    final_test=final_test+"run function {project_id}:v{project_version}/load".format(project_id=ctx.project_id,project_version=ctx.project_version)

    function=function+final_test
    ctx.data.functions[f"{ctx.project_id}:v{ctx.project_version}/test_load"]=TextFile(function)
    

    # dep functions tag
    load_dependencies_tag={
        "values":[]
    }
    for dep in ctx.meta["smithed_dependencies"]:
        load_dependencies_tag["values"].append({"id":"{dep_prefix}:load".format(dep_prefix=dep["versioning"]["prefix"]), "required":False})
    
    ctx.data.function_tags["{project_id}:load/dependencies".format(project_id=ctx.project_id)]=JsonFile(load_dependencies_tag)
        


def cache_dependencies(ctx: Context):
    "Injecting cache_dependencies"
    download_url = (
        "https://api.smithed.dev/v2/download"
        "?pack={pack_id}@{pack_version}"
        "&mode={mode}"
    )
    if not "airdox_" in ctx.cache.json:
        ctx.cache.json["airdox_"]={
            "list_dep":[],
        }

    list_dep=list()
    for dep in ctx.meta["smithed_dependencies"]:
        list_dep.append(f"{dep['id']}@{dep['version_']}")
    
      
    for dep in list_dep:
        if dep not in ctx.cache.json["airdox_"]["list_dep"]:
            print(f"Downloading {dep}")
            ctx.cache.json["airdox_"]["list_dep"].append(dep)
            dep_full_id,dep_version=dep.split("@")
            dep_author,dep_id=dep_full_id.split(":")
            datapack=requests.get(download_url.format(pack_id=dep_id,pack_version=dep_version,mode="datapack"))
            resourcepack=requests.get(download_url.format(pack_id=dep_id,pack_version=dep_version,mode="resourcepack"))

            try:
                os.mkdir(f"{ctx.cache.path}/airdox_")
                os.mkdir(f"{ctx.cache.path}/airdox_/dep")
            except:
                pass
            with open(f"{ctx.cache.path}/airdox_/dep/{dep_id}@{dep_version}_datapack.zip","wb") as f:
                f.write(datapack.content)
            with open(f"{ctx.cache.path}/airdox_/dep/{dep_id}@{dep_version}_resourcepack.zip","wb") as f:
                f.write(resourcepack.content)

            
            
            
            

def load_included(ctx: Context):
    ctx.require(model_merging)
    
    for dep in ctx.meta["smithed_dependencies"]: 
        dep_author,dep_id=dep["id"].split(":")
        identifier=f"{dep_id}@{dep['version_']}"
        data=DataPack(zipfile=f"{ctx.cache.path}/airdox_/dep/{identifier}_datapack.zip")
        assets=ResourcePack(path=f"{ctx.cache.path}/airdox_/dep/{identifier}_resourcepack.zip")

        if "load:load" in data.function_tags:
            del data.function_tags["load:load"]
        if "pack.png" in data.extra:
            del data.extra["pack.png"]
        if "pack.png" in assets.extra:
            del assets.extra["pack.png"]
        
        ctx.assets.merge(assets)
        ctx.data.merge(data)

