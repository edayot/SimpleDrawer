import json
import shutil
import git
import os
from PIL import Image

with open("make_release.json") as f:
    config=json.load(f)

def list_files(dir):
    r = []
    for root, dirs, files in os.walk(dir):
        for name in files:
            r.append(os.path.join(root, name))
    return r

def enumerate_versioning(namespace_data,version,major,minor,patch):
    with open(f"{namespace_data}/functions/{version}/load/enumerate.mcfunction","w") as f:
        function=f"""scoreboard players reset {config['namespace']} load.status
scoreboard players add {config['namespace']}.major load.status 0
scoreboard players add {config['namespace']}.minor load.status 0
scoreboard players add {config['namespace']}.patch load.status 0
function {config['namespace']}:{version}/load/enumerate/major"""
        f.write(function)
    with open(f"{namespace_data}/functions/{version}/load/enumerate/major.mcfunction","w") as f:
        function=f"""execute if score {config['namespace']}.major load.status matches ..{major} unless score {config['namespace']}.major load.status matches {major} run function {config['namespace']}:{version}/load/enumerate/set_version
execute unless score {config['namespace']} load.status matches 1 if score {config['namespace']}.major load.status matches ..{major} if score {config['namespace']}.major load.status matches {major} run function {config['namespace']}:{version}/load/enumerate/minor
"""
        f.write(function)
    with open(f"{namespace_data}/functions/{version}/load/enumerate/minor.mcfunction","w") as f:
        function=f"""execute if score {config['namespace']}.minor load.status matches ..{minor} unless score {config['namespace']}.minor load.status matches {minor} run function {config['namespace']}:{version}/load/enumerate/set_version
execute unless score {config['namespace']} load.status matches 1 if score {config['namespace']}.minor load.status matches ..{minor} if score {config['namespace']}.minor load.status matches {minor} run function {config['namespace']}:{version}/load/enumerate/patch
"""     
        f.write(function)
    with open(f"{namespace_data}/functions/{version}/load/enumerate/patch.mcfunction","w") as f:
        function=f"""execute if score {config['namespace']}.patch load.status matches ..{patch} unless score {config['namespace']}.patch load.status matches {patch} run function {config['namespace']}:{version}/load/enumerate/set_version
"""
        f.write(function)
    with open(f"{namespace_data}/functions/{version}/load/enumerate/set_version.mcfunction","w") as f:
        function=f"""scoreboard players set {config['namespace']}.major load.status {major}
scoreboard players set {config['namespace']}.minor load.status {minor}
scoreboard players set {config['namespace']}.patch load.status {patch}

scoreboard players set {config['namespace']} load.status 1"""

        f.write(function)
    
    #resolve
    with open(f"{namespace_data}/functions/{version}/load/resolve.mcfunction","w") as f:
        function=f"""schedule clear {config['namespace']}:{version}/tick
execute if score {config['namespace']}.major load.status matches {major} if score {config['namespace']}.minor load.status matches {minor} if score {config['namespace']}.patch load.status matches {patch} run function {config['namespace']}:{version}/load
"""
        f.write(function)

def change_version(version):
    v=version[1:].split(".")
    major=v[0]
    minor=v[1]
    patch=v[2]
    namespace_data=f"{config['name']} DataPack/data/{config['namespace']}/"

    if config["datapack"]:
        if config["versioning"]:
            with open(f"{namespace_data}/functions/{version}/print_version.mcfunction","w") as f:
                message=[
                    {"translate":f"{config['namespace']}.load","color":"green"},
                    {"text":f"{version}]","color":"green"}
                ]
                f.write(f'tellraw @s {message}')
            
            ## Enumerate thing 
            enumerate_versioning(namespace_data,version,major,minor,patch)
        else:
            with open(f"{namespace_data}/functions/print_version.mcfunction","w") as f:
                message=[
                    {"translate":f"{config['namespace']}.load","color":"green"},
                    {"text":f"{version}]","color":"green"}
                ]
                f.write(f'tellraw @s {message}')
            
            with open(f"{namespace_data}/functions/set_version.mcfunction","w") as f:
                f.write(f"""scoreboard players set {config['namespace']}.major load.status {major}
        scoreboard players set {config['namespace']}.minor load.status {minor}
        scoreboard players set {config['namespace']}.patch load.status {patch}
                    """)
            
        with open(f"{config['name']} DataPack/pack.mcmeta","w") as f:
            pack={
                "pack":{
                    "pack_format":10,
                    "description":f"{config['name']} DataPack {version} : \n§rThe datapack"
                }
            }
            json.dump(pack,f, indent = 4)
        with open(f"{config['name']} DataPack/data/global/advancements/{config['usernamespace']}/{config['namespace']}.json","w") as f:
            pack={
            "display": {
                "title": config['name'],
                "description": f"{version}",
                "icon": config["icon"],
                "announce_to_chat": False,
                "show_toast": False
            },
            "parent": f"global:{config['usernamespace']}/root",
            "criteria": {
                "trigger": {
                    "trigger": "minecraft:tick"
                }
            }
        }
            json.dump(pack,f, indent = 4)



    if config["resourcepack"]:
        with open(f"{config['name']} ResourcePack/pack.mcmeta","w") as f:
            pack={
                "pack":{
                    "pack_format":9,
                    "description":f"{config['name']} ResourcePack {version} : \n§rThe resourcepack"
                }
            }
            json.dump(pack,f, indent = 4)
    
    

def create_zip(version):
    try:
        shutil.rmtree("build")
    except:
        pass
    if config["datapack"]:
        shutil.copytree(f"{config['name']} DataPack",f"build/{config['name']} DataPack")
    if config["resourcepack"]:
        shutil.copytree(f"{config['name']} ResourcePack",f"build/{config['name']} ResourcePack")

    #optimizing images
    for filepath in list_files("build"):
        if filepath.endswith(".png"):
            #print(f'{filepath=}')
            img=Image.open(filepath)
            img.convert("P", palette=Image.ADAPTIVE)
            img.save(filepath)
            

    
    if config["datapack"]:
        #normal release
        shutil.make_archive(f"release/{config['name']}_DataPack_"+version, "zip", f"build/{config['name']} DataPack")
        #delete integrated libs
        if "smithed.crafter" in config["dependencies"]:
            shutil.rmtree(f"build\{config['name']} DataPack\data\smithed.crafter")
            shutil.copytree(f"{config['name']} DataPack/data/smithed.crafter/tags/functions/event",f"build/{config['name']} DataPack/data/smithed.crafter/tags/functions/event")
            delete_line(f"build/{config['name']} DataPack/data/smithed.crafter/tags/functions/event/recipes.json",'        "#smithed.crafter:recipes/shaped",\n')
        if "smithed.custom_block" in config["dependencies"]:
            shutil.rmtree(f"build\{config['name']} DataPack\data\smithed.custom_block")
            shutil.copytree(f"{config['name']} DataPack/data/smithed.custom_block/tags/functions/event",f"build/{config['name']} DataPack/data/smithed.custom_block/tags/functions/event")
            delete_line(f"build/{config['name']} DataPack/data/smithed.custom_block/tags/functions/event/on_place.json",'        "#smithed.crafter:block/place",\n')
        #create_zip
        shutil.make_archive(f"release/{config['name']}_DataPack_{version}_NoLibrairies", "zip", f"build/{config['name']} DataPack")

    if config["resourcepack"]:
        shutil.make_archive(f"release/{config['name']}_ResourcePack_{version}", "zip", f"build/{config['name']} ResourcePack")
        shutil.rmtree(f"build\{config['name']} ResourcePack\\assets\smithed.crafter")
        delete_line(f"build/{config['name']} ResourcePack/assets/minecraft/models/item/furnace.json",'        ,{"predicate": {"custom_model_data": 4250001},"model": "smithed.crafter:block/table"}\n')
        shutil.make_archive(f"release/{config['name']}_ResourcePack_"+version+"_NoLibrairies", "zip", f"build/{config['name']} ResourcePack")

    

    

    

    
def delete_line(file,line):
    with open(file,"r") as f:
        #delete a line from furnace.json
        lines=f.readlines()
        lines.remove(line)
    with open(file,"w") as f:
        f.writelines(lines)




def git_push(version):
    r = git.Repo.init("")
    if config["datapack"]:
        r.index.add(f"{config['name']} DataPack/pack.mcmeta")
        r.index.add(f"{config['name']} DataPack/data/{config['namespace']}/functions/print_version.mcfunction")
        r.index.add(f"{config['name']} DataPack/data/{config['namespace']}/functions/set_version.mcfunction")
        r.index.add(f"{config['name']} DataPack/data/global/advancements/{config['usernamespace']}/{config['namespace']}.json")

    if config["resourcepack"]:
        r.index.add(f"{config['name']} ResourcePack/pack.mcmeta")
    

    r.index.commit(f"[AUTO] updated to {version}")
    r.remote("origin").push()


def start():
    version=input("Please select a version tag : ")
    if len(version)>0:
        check=input("The version tag is "+version+" confirm [y/n]")
        if check=="y":
            change_version(version)
            git_push(version)
            create_zip(version)

if __name__=="__main__" and False:
    start()