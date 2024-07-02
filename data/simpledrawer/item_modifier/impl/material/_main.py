import pathlib
import json

def get_item_modifier(material):
    return [
        {
            "function": "minecraft:modify_contents",
            "component": "minecraft:container",
            "modifier": {
            "function": "minecraft:set_custom_data",
            "tag": "{simpledrawer:{wood_type:\"XXX\"}}".replace("XXX",material)
            }
        },
        {
            "function": "minecraft:set_components",
            "components": {
            "minecraft:trim": {
                "material": material,
                "pattern": "minecraft:sentry",
                "show_in_tooltip": False
            }
            }
        }
    ]

path = pathlib.Path(__file__).parent

for material in ["acacia","bamboo","birch","cherry","crimson","dark_oak","jungle","mangrove","spruce","warped","oak", "ice"]:
    item_modifier = get_item_modifier(f"simpledrawer:{material}")
    with open(path / f"{material}.json", "w") as f:
        json.dump(item_modifier,f,indent=4)