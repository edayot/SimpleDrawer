from beet import Context, FunctionTag, TextFile, ResourcePack, DataPack, JsonFile, Mcmeta, Function, NamespaceFileScope
from copy import deepcopy
from pathlib import PurePath
from beet.contrib.model_merging import model_merging
from typing import ClassVar, Iterable, List, Optional, Tuple, TypeVar, Union
import beet
from beet.core.file import (
    JsonFile,
    TextFileBase,
)
from dataclasses import dataclass
from rich import inspect

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

                


def clean_useless_tags(ctx: Context):
    for useless_tag in ctx.data.function_tags.match(f"{ctx.project_id}:_useless"):
        del ctx.data.function_tags[useless_tag]



        

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

execute unless score #{project_id}.{dep_id} load.status matches 1 run tellraw @a [{{"translate":"{project_id}.tellraw_prefix","color":"dark_red"}},{{"text":"Error Loading {project_name}, {dep_name} v","color":"red"}},{{"score":{{"name":"#{project_id}.{dep_id}.major","objective":"load.status"}},"color":"red"}},{{"text":".","color":"red"}},{{"score":{{"name":"#{project_id}.{dep_id}.minor","objective":"load.status"}},"color":"red"}},{{"text":".","color":"red"}},{{"score":{{"name":"#{project_id}.{dep_id}.patch","objective":"load.status"}},"color":"red"}},{{"text":"+ is required but the installed version is v","color":"red"}},{{"score":{{"name":"{dep_prefix}.major","objective":"load.status"}},"color":"red"}},{{"text":".","color":"red"}},{{"score":{{"name":"{dep_prefix}.minor","objective":"load.status"}},"color":"red"}},{{"text":".","color":"red"}},{{"score":{{"name":"{dep_prefix}.patch","objective":"load.status"}},"color":"red"}}]


"""
    function=""
    final_test="execute "

    for dep in ctx.meta["weld_deps"]["deps"]:
        if dep["versioning"]["type"]=="normal":
            
            major,minor,patch = dep["version"].split(".")
            
            function=function+dep_check.format(project_id=ctx.project_id,dep_id=dep["id"],dep_name=dep["id"],dep_major=major,dep_minor=minor,dep_patch=patch,dep_prefix=dep["versioning"]["prefix"],project_name=ctx.project_name)

            final_test=final_test+"if score #{project_id}.{dep_id} load.status matches 1 ".format(project_id=ctx.project_id,dep_id=dep["id"])

    final_test=final_test+"run function {project_id}:v{project_version}/load".format(project_id=ctx.project_id,project_version=ctx.project_version)

    function=function+final_test
    ctx.data.functions.setdefault(f"{ctx.project_id}:impl/test_load").append(function)
    

    # dep functions tag
    load_dependencies_tag={
        "values":[]
    }
    for dep in ctx.meta["weld_deps"]["deps"]:
        load_dependencies_tag["values"].append({"id":"{dep_prefix}:load".format(dep_prefix=dep["versioning"]["prefix"]), "required":False})
    
    ctx.data.function_tags[f"{ctx.project_id}:load/dependencies"]=FunctionTag(load_dependencies_tag)
        


class PackTest(Function):
    """Class representing a PackTest test."""

    scope: ClassVar[NamespaceFileScope] = {0:("tests",),45:("test",)}

@dataclass
class PackTestManager:
    """Service for managing json messages."""

    ctx: Context

    def __post_init__(self):
        self.ctx.data.extend_namespace.append(PackTest)
    


def add_tests_directory(ctx: Context):
   ctx.inject(PackTestManager)
            
            


def add_id(ctx: Context):
    """Function to add the id to the pack.mcmeta"""
    ctx.assets.extra["pack.mcmeta"].data["id"]=str(ctx.project_id)
    ctx.data.extra["pack.mcmeta"].data["id"]=str(ctx.project_id)

    
def monkey_patch_1_21(ctx: Context):
    ctx.data.structures.proxy_key.scope = ("structure",)
    ctx.data.advancements.proxy_key.scope = ("advancement",)
    ctx.data.recipes.proxy_key.scope = ("recipe",)
    ctx.data.loot_tables.proxy_key.scope = ("loot_table",)
    ctx.data.predicates.proxy_key.scope = ("predicate",)
    ctx.data.item_modifiers.proxy_key.scope = ("item_modifier",)
    ctx.data.functions.proxy_key.scope = ("function",)
    ctx.data.function_tags.proxy_key.scope = ("tags", "function")
    ctx.data.item_tags.proxy_key.scope = ("tags", "item")
    ctx.data.block_tags.proxy_key.scope = ("tags", "block")
    ctx.data.entity_type_tags.proxy_key.scope = ("tags", "entity_type")
    ctx.data.fluid_tags.proxy_key.scope = ("tags", "fluid")
    ctx.data.game_event_tags.proxy_key.scope = ("tags", "game_event")
    ctx.data.pack_format = 48
    ctx.assets.pack_format = 34
    
    
    