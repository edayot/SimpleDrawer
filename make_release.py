import json
from os import access
import shutil
import git



def change_version(version):
    v=version[1:].split(".")
    major=v[0]
    minor=v[1]
    patch=v[2]
    with open("SimpleDrawer DataPack/data/simpledrawer/functions/print_version.mcfunction","w") as f:
        f.write('tellraw @a [{"translate":"simpledrawer.load","color":"green"},{"text":"'+version+'","color":"green"}]\nscoreboard players set simpledrawer load.status 1')
    
    with open("SimpleDrawer DataPack/data/simpledrawer/functions/set_version.mcfunction","w") as f:
        f.write("""scoreboard players set simpledrawer.major load.status {}
scoreboard players set simpledrawer.minor load.status {}
scoreboard players set simpledrawer.patch load.status {}
            """.format(major,minor,patch))
        

    with open("SimpleDrawer DataPack/pack.mcmeta","w") as f:
        pack={
            "pack":{
                "pack_format":10,
                "description":"§aSimpleDrawer DataPack "+version+" :\n§rAdd drawers in to minecraft, by AirDox_"
            }
        }
        json.dump(pack,f, indent = 4)
    with open("SimpleDrawer ResourcePack/pack.mcmeta","w") as f:
        pack={
            "pack":{
                "pack_format":9,
                "description":"§aSimpleDrawer ResourcePack "+version+" :\n§rSimpleDrawer's Resource pack, by AirDox_"
            }
        }
        json.dump(pack,f, indent = 4)
    
    with open("SimpleDrawer DataPack/data/global/advancements/airdox_/simpledrawer.json","w") as f:
        pack={
        "display": {
            "title": "Simple Drawer",
            "description": version+"\nA datapack that add drawer to minecraft",
            "icon": {
                "item": "minecraft:beehive",
                "nbt": "{CustomModelData:1430000}"
            },
            "announce_to_chat": False,
            "show_toast": False
        },
        "parent": "global:airdox_/root",
        "criteria": {
            "trigger": {
                "trigger": "minecraft:tick"
            }
        }
    }
        json.dump(pack,f, indent = 4)

def create_zip(version):
    shutil.make_archive("release/SimpleDrawer_DataPack_"+version, "zip", "SimpleDrawer DataPack")
    shutil.make_archive("release/SimpleDrawer_ResourcePack_"+version, "zip", "SimpleDrawer ResourcePack")
    




def git_push(version):
    r = git.Repo.init("")
    r.index.add("SimpleDrawer DataPack/pack.mcmeta")
    r.index.add("SimpleDrawer ResourcePack/pack.mcmeta")
    r.index.add("SimpleDrawer DataPack/data/simpledrawer/functions/print_version.mcfunction")
    r.index.add("SimpleDrawer DataPack/data/simpledrawer/functions/set_version.mcfunction")
    r.index.add("SimpleDrawer DataPack/data/global/advancements/airdox_/simpledrawer.json")

    r.index.commit("[AUTO] updated to "+version)
    r.remote("origin").push()




if __name__=="__main__":
    version=input("Please select a version tag : ")
    check=input("The version tag is "+version+" confirm [y/n]")
    if check=="y" and len(version)>0:
        change_version(version)
        git_push(version)
        create_zip(version)