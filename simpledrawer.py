
from beet import Context, Function
import nbtlib
import requests


def generate_version_string(versions):
    if not versions:
        return "No versions specified"

    if len(versions) == 1:
        return versions[0]

    version_string = ', '.join(versions[:-1]) + " or " + versions[-1]
    return version_string

def add_mc_version_support(ctx: Context):
    "Injecting mc_version_support"
    t=""
    for dataversion in ctx.meta["mc_supports_dataversion"]:
        t=t+f"execute if score #dataversion simpledrawer.math matches {dataversion} run scoreboard players set #goodversion simpledrawer.math 1\n"
    t=t+'\n'
    final_tellraw='execute unless score #goodversion simpledrawer.math matches 1 run tellraw @a [{"translate":"simpledrawer.tellraw_prefix","color":"dark_red"},{"text": "SimpleDrawer may not work in this version of Minecraft!, it\'s only compatible with {mc_version}","color":"red"}]'
    
    versions=generate_version_string(ctx.meta["mc_supports"])

    t=t+final_tellraw.replace("{mc_version}",versions)+"\n"

    path_function="simpledrawer:impl/mc_version_warning_2".replace("impl/","v"+ctx.project_version+"/")

    ctx.data.functions[path_function].append(t)


def add_versioning_to_items(ctx: Context):

    major, minor, patch = ctx.project_version.split(".")
    
    versioning = f"data modify storage simpledrawer:main version set value {{major:{major},minor:{minor},patch:{patch}}}"
    
    path_function="simpledrawer:impl/versioning_items".replace("impl/","v"+ctx.project_version+"/")

    ctx.data.functions[path_function]=Function()
    ctx.data.functions[path_function].append(versioning)




def get_translation(key, id):
    return {
        "function": "minecraft:set_lore",
        "entity": "this",
        "lore": [
            {
                "translate": "container.shulkerBox.itemCount",
                "with": [
                    {
                        "translate": key,
                        "color": "white",
                        "italic": False
                    },
                    {
                        "score": {
                            "name": "#count_destroy",
                            "objective": "simpledrawer.math"
                        }
                    }
                ],
                "color": "white",
                "italic": False
            }
        ],
        "mode": "append",
        "conditions": [
            {
                "condition": "minecraft:entity_properties",
                "entity": "this",
                "predicate": {
                    "equipment": {
                        "mainhand": {
                            "items": id
                        }
                    }
                }
            }
        ]
    }




def generate_translation(ctx: Context):

    mc_version = ctx.meta.get("mc_supports", ["1.20.6"])
    mc_version = mc_version[0]

    url = f"https://raw.githubusercontent.com/misode/mcmeta/{mc_version}-summary/item_components/data.json"

    r = requests.get(url)
    r.raise_for_status()

    data = r.json()
    print(data)