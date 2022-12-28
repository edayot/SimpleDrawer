from beet import Context, Model, DataPack, ResourcePack, TextFile
from copy import deepcopy
import os
from contextlib import suppress





def custom_merge(self, other: "Model") -> bool:
    for overide in other.data["overrides"]:
        self.data["overrides"].append(deepcopy(overide))
    
    #take all overrides in a separate list if overide["predicate"]["custom_model_data"] does not exist
    #then sort the list by custom_model_data
    not_custom_model_data=[]
    for overide in self.data["overrides"]:
        if "custom_model_data" not in overide["predicate"]:
            self.data["overrides"].remove(overide)
            not_custom_model_data.append(overide)
    self.data["overrides"].sort(key=lambda x: x["predicate"]["custom_model_data"])
    
    for overide in not_custom_model_data:
        self.data["overrides"].append(overide)
        
    return True





def dependency_injection(ctx: Context):
    "Injecting dependency"
    current_path=ctx.meta["airdox_"]["include_path"]
    for path in os.listdir(ctx.meta["airdox_"]["include_path"]):
        
        #DataPack
        data=DataPack(path=current_path+path)
        with suppress(KeyError):
            del data.extra["pack.png"]
        with suppress(KeyError):
            del data.function_tags["load:load"] # delete load:load in every pack
        ctx.data.merge(data)

        #ResourcePack
        resource=ResourcePack(path=current_path+path)
        with suppress(KeyError):
            del resource.extra["pack.png"]
        for model in resource.models.match("minecraft:*"):
            custom_merge(ctx.assets.models[model],resource.models[model])
            del resource.models[model]
            
        ctx.assets.merge(resource)
        

def add_license(ctx: Context):
    "Injecting LICENSE"
    path_to_license=ctx.meta["airdox_"]["license_path"]
    #take the file name from the path
    file_name=path_to_license.split("/")[-1]
    ctx.data.extra[file_name]=TextFile(open(path_to_license).read())
    


    

