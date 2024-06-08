



#say 24

scoreboard players set #if_item simpledrawer.math 0
execute if data entity @s item.components."minecraft:container"[{slot:24}].item run function simpledrawer:impl/new_drawer/working/io/24/input/if_item
execute if score #if_item simpledrawer.math matches 0 run function simpledrawer:impl/new_drawer/working/io/24/input/unless_item


