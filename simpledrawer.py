
from beet import Context, Function
import nbtlib


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
    versioning="# Versioning\n"
    major,minor,patch=ctx.project_version.split(".")
    command='data modify storage simpledrawer:main ItemsNBT.{item}.tag.simpledrawer.version set value {{major:{major},minor:{minor},patch:{patch}}}'
    command_furnace='data modify storage simpledrawer:main ItemsNBT.{item}.tag.BlockEntityTag.Items[0].tag.simpledrawer.version set value {{major:{major},minor:{minor},patch:{patch}}}'
    
    items=["hopper_upgrade","iron_upgrade","gold_upgrade","diamond_upgrade","star_upgrade","netherite_upgrade","downgrade_wrench","guide"]
    items_with_furnace=["drawer","new_drawer","double_new_drawer","quadruple_new_drawer","compacting_new_drawer"]

    for item in items_with_furnace:
        versioning=versioning+command_furnace.format(item=item,major=major,minor=minor,patch=patch)+"\n"
    for item in items+items_with_furnace:
        versioning=versioning+command.format(item=item,major=major,minor=minor,patch=patch)+"\n"
    
    path_function="simpledrawer:impl/versioning_items".replace("impl/","v"+ctx.project_version+"/")

    ctx.data.functions[path_function]=Function()
    ctx.data.functions[path_function].append(versioning)