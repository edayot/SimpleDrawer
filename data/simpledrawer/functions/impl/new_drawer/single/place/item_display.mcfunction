
tag @s add simpledrawer.new_drawer.part
tag @s add simpledrawer.new_drawer.part.item_display

scoreboard players operation @s simpledrawer.new_drawer.id = #global simpledrawer.new_drawer.id
scoreboard players operation @s simpledrawer.new_drawer.part_id = #part_index simpledrawer.new_drawer.part_id



tp @s ~ ~ ~ ~ ~
data merge entity @s {transformation:{scale:[0.8f,0.8f,0.01f]},item_display:"gui"}

data modify storage simpledrawer:main temp.item_stored.Count set value 1b
data modify entity @s item set from storage simpledrawer:main temp.item_stored
