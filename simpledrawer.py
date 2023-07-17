
from beet import Context

def add_mc_version_support(ctx: Context):
    "Injecting mc_version_support"
    t=""
    for dataversion in ctx.meta["mc_supports_dataversion"]:
        t=t+f"execute if score #dataversion simpledrawer.math matches {dataversion} run scoreboard players set #goodversion simpledrawer.math 1\n"
    t=t+'\n'
    final_tellraw='execute unless score #goodversion simpledrawer.math matches 1 run tellraw @a [{"translate":"simpledrawer.tellraw_prefix","color":"dark_red"},{"text": "SimpleDrawer may not work in this version of Minecraft!, it\'s only compatible with {mc_version}","color":"red"}]'
    versions=""
    for mc_version in ctx.meta["mc_supports"][:-1]:
        versions=versions+mc_version+", "
    versions=versions[:-2]+" and "+ctx.meta["mc_supports"][-1]
    t=t+final_tellraw.replace("{mc_version}",versions)+"\n"

    path_function="simpledrawer:impl/mc_version_warning_2".replace("impl/","v"+ctx.project_version+"/")

    ctx.data.functions[path_function].append(t)
    