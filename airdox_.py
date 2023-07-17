from beet import Context, TextFile
from copy import deepcopy
from pathlib import PurePath

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
