
import json


for wood_type in ["acacia","bamboo","birch","cherry","crimson","dark_oak","jungle","mangrove","spruce","warped","oak"]:
    for drawer_type in [1,2,4]:
        with open(f"{wood_type}_full_drawers_{drawer_type}.json","w") as f:
            j={
                "parent": "simpledrawer:block/new_drawer/full_drawers_orientable",
                "textures": {
                    "top": f"simpledrawer:block/new_drawer/drawers_{wood_type}_side",
                    "front": f"simpledrawer:block/new_drawer/drawers_{wood_type}_front_{drawer_type}",
                    "side": f"simpledrawer:block/new_drawer/drawers_{wood_type}_side",
                    "bottom": f"simpledrawer:block/new_drawer/drawers_{wood_type}_trim",
                    "particle": f"simpledrawer:block/new_drawer/drawers_{wood_type}_front_{drawer_type}"
                }
            }
            f.write(json.dumps(j,indent=4))
        with open(f"{wood_type}_full_drawers_{drawer_type}_tapped.json","w") as f:
            j={
                "parent": "simpledrawer:block/new_drawer/full_drawers_orientable_tapped",
                "textures": {
                    "top": f"simpledrawer:block/new_drawer/drawers_{wood_type}_side",
                    "front": f"simpledrawer:block/new_drawer/drawers_{wood_type}_front_{drawer_type}",
                    "side": f"simpledrawer:block/new_drawer/drawers_{wood_type}_side",
                    "bottom": f"simpledrawer:block/new_drawer/drawers_{wood_type}_trim",
                    "particle": f"simpledrawer:block/new_drawer/drawers_{wood_type}_front_{drawer_type}"
                }
            }
            f.write(json.dumps(j,indent=4))


