import json
from os import access
import shutil
import git



def change_version(version):
    with open("SimpleDrawer DataPack/data/simpledrawer/functions/print_version.mcfunction","w") as f:
        f.write('tellraw @a {"text":"Loaded SimpleDrawer '+version+'","color":"green"}')
    with open("SimpleDrawer DataPack/pack.mcmeta","w") as f:
        pack={
            "pack":{
                "pack_format":6,
                "description":"§aSimpleDrawer DataPack "+version+" :\n§rA simple datapack that add drawers in to minecraft"
            }
        }
        json.dump(pack,f, indent = 4)
    with open("SimpleDrawer RessourcePack/pack.mcmeta","w") as f:
        pack={
            "pack":{
                "pack_format":8,
                "description":"§aSimpleDrawer RessourcePack "+version+" :\n§rThe ressource pack of the SimpleDrawer datapack"
            }
        }
        json.dump(pack,f, indent = 4)

def create_zip(version):
    shutil.make_archive("release/SimpleDrawer_DataPack_"+version, "zip", "SimpleDrawer DataPack")
    shutil.make_archive("release/SimpleDrawer_RessourcePack_"+version, "zip", "SimpleDrawer RessourcePack")

def git_push(version):
    r = git.Repo.init("")
    r.index.add("SimpleDrawer DataPack/pack.mcmeta")
    r.index.add("SimpleDrawer RessourcePack/pack.mcmeta")
    r.index.add("SimpleDrawer DataPack/data/simpledrawer/functions/print_version.mcfunction")

    r.index.commit("[AUTO] updated to "+version)
    r.index.push()




if __name__=="__main__":
    version=input("Please select a version tag : ")
    check=input("The version tag is "+version+" confirm [y/n]")
    if check=="y":
        change_version(version)
        git_push(version)
        create_zip(version)