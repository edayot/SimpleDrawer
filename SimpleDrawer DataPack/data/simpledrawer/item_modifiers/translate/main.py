import os
import json



def generate(id,translate):
    item_modifier={
        "function": "minecraft:set_lore",
        "entity": "this",
        "lore": [
            [
                {
                    "score": {
                        "name": "#count",
                        "objective": "simpledrawer.math"
                    },
                    "color": "white",
                    "italic": False
                },
                {
                    "text": " / ",
                    "color": "gray",
                    "italic": False
                },
                {
                    "score": {
                        "name": "#maxCount",
                        "objective": "simpledrawer.math"
                    },
                    "color": "white",
                    "italic": False
                },
                {
                    "translate": "simpledrawer.text.of",
                    "color": "gold",
                    "italic": False
                },
                {
                    "translate": translate,
                    "color":"white",
                    "italic": False
                }
            ],
            {
                "translate": "simpledrawer.name",
                "color": "blue",
                "italic": True
            }
        ],
        "conditions": [
            {
                "condition": "minecraft:entity_properties",
                "entity": "this",
                "predicate": {
                    "equipment": {
                        "mainhand": {
                            "items": [
                                id
                            ]
                        }
                    }
                }
            }
        ]
    }
    return item_modifier

def get_ids():
    #Get all items ids
    with open("all.jsonD","r") as f:
        data=json.load(f)
    return data["values"]

def get_translate_from_id(id):
    #Get translate from id
    translate=id
    translate=translate.replace(":",".")
    with open("en_us.jsonD","r") as f:
        data=json.load(f)
        if "block."+translate in data:
            return "block."+translate
        elif "item."+translate in data:
            return "item."+translate
        else:
            return None
    

def main():
    id_list=get_ids()
    #id_list=["minecraft:stone"]
    I=[]
    for id in id_list:
        translate=get_translate_from_id(id)
        if translate is not None:
            item_modifier=generate(id,translate)
            I.append(item_modifier)
        else:
            print("No translate for "+id)
            #delete id from all.jsonD
            with open("all.jsonD","r") as f:
                data=json.load(f)
                data["values"].remove(id)
            with open("all.jsonD","w") as f:
                json.dump(data,f,indent=4)
    with open("test_translate.json","w") as f:
        json.dump(I,f,indent=4)