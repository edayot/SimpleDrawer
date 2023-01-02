from beet import Context, Model, DataPack, ResourcePack, TextFile
from copy import deepcopy
import os
from contextlib import suppress






        

def add_license(ctx: Context):
    "Injecting LICENSE"
    path_to_license=ctx.meta["airdox_"]["license_path"]
    #take the file name from the path
    file_name=path_to_license.split("/")[-1]
    ctx.data.extra[file_name]=TextFile(open(path_to_license).read())
    


def delete_load_tag_and_packpng(ctx: Context):
    del ctx.data.function_tags["load:load"]
    del ctx.data.extra["pack.png"]
