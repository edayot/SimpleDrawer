
scoreboard players set #if_item simpledrawer.math 1
#say if item
data modify storage simpledrawer:main temp.item1 set from storage simpledrawer:io input
data modify storage simpledrawer:main temp.item2 set from entity @s item.tag.simpledrawer.Items[{Slot:22}]

data remove storage simpledrawer:main temp.item1.Count
data remove storage simpledrawer:main temp.item2.Count

data remove storage simpledrawer:main temp.item1.Slot
data remove storage simpledrawer:main temp.item2.Slot

execute store success score #!same simpledrawer.math run data modify storage simpledrawer:main temp.item1 set from storage simpledrawer:main temp.item2
execute if score #!same simpledrawer.math matches 0 run function simpledrawer:impl/new_drawer/working/io/22/input/if_item_same





