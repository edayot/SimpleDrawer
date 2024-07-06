scoreboard players set #simpledrawer.trim_loaded load.status 0
execute 
    summon item_display
    run function ./check_trim_loading:
        execute store result score #simpledrawer.trim_loaded load.status run loot replace entity @s container.0 loot simpledrawer:impl/items/compacting_new_drawer
        kill @s

execute
    if score #simpledrawer.trim_loaded load.status matches 0
    run tellraw @a [
        "",
        {"translate":"simpledrawer.tellraw_prefix","color":"dark_red"},
        {"text":"The datapack will not work unless a server restart or quitting and rejoining the world","color":"red"}
    ]
