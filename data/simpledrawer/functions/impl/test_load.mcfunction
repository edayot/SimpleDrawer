scoreboard players set #trim_loaded simpledrawer.math 0
execute 
    summon item_display
    run function ./check_trim_loading:
        execute store result score #trim_loaded simpledrawer.math run loot replace entity @s container.0 loot simpledrawer:impl/items/compacting_new_drawer
        kill @s

execute
    if score #trim_loaded simpledrawer.math matches 0
    run tellraw @a [
        "",
        {"translate":"simpledrawer.tellraw_prefix","color":"dark_red"},
        {"text":"The datapack will not work unless a server restart or quitting and rejoining the world","color":"red"}
    ]
