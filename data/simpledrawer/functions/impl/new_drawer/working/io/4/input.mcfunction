



#say 4

scoreboard players set #if_item simpledrawer.math 0
execute if data entity @s item.components."minecraft:custom_data".simpledrawer.Items[{Slot:4}] run function simpledrawer:impl/new_drawer/working/io/4/input/if_item
execute if score #if_item simpledrawer.math matches 0 run function simpledrawer:impl/new_drawer/working/io/4/input/unless_item


