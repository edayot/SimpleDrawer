



#say 21

scoreboard players set #if_item simpledrawer.math 0
execute if data entity @s item.tag.simpledrawer.Items[{Slot:21}] run function simpledrawer:impl/new_drawer/working/io/21/input/if_item
execute if score #if_item simpledrawer.math matches 0 run function simpledrawer:impl/new_drawer/working/io/21/input/unless_item


