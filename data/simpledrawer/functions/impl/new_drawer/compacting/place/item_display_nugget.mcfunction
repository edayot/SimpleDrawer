
tag @s add simpledrawer.new_drawer.part
tag @s add simpledrawer.new_drawer.part.item_display
tag @s add simpledrawer.new_drawer.part.item_display_nugget
tag @s add simpledrawer.new_drawer.part.item_display_compacting


scoreboard players operation @s simpledrawer.new_drawer.id = #global simpledrawer.new_drawer.id
scoreboard players operation @s simpledrawer.new_drawer.part_id = #part_index simpledrawer.new_drawer.part_id



tp @s ~ ~ ~ ~180 ~
data merge entity @s {transformation:{scale:[0.6f,0.6f,0.01f]},item_display:"gui"}

data modify storage simpledrawer:main temp.item_go set from storage simpledrawer:main temp.item_stored

data modify storage simpledrawer:main temp.item_go.Count set value 1b
data modify entity @s item set from storage simpledrawer:main temp.item_go
