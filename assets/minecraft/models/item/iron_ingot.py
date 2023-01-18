

import json 

#load iron_ingot_base.json into a dictionary
with open("iron_ingot_base.json","r") as f:
    model=json.load(f)

#add override to the model
model["overrides"]=[]
for i in range(0,1000):
    model["overrides"].append({
        "predicate": {
            "custom_model_data": 1430000+i
        },
        "model": f"simpledrawer:item/numbers/{i}"
    })
    
#write the model to a file
with open("iron_ingot.json","w") as f:
    json.dump(model,f,indent=4)