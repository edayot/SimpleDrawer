
tag @s add global.ignore
tag @s add simpledrawer.new_drawer.part
tag @s add simpledrawer.new_drawer.part.item_display

tag @s add smithed.entity
tag @s add smithed.strict

scoreboard players operation @s simpledrawer.new_drawer.id = #place_id simpledrawer.math
scoreboard players operation @s simpledrawer.new_drawer.part_id = #part_index simpledrawer.new_drawer.part_id



tp @s ~ ~ ~ ~180 ~
data merge entity @s {transformation:{scale:[0.25f,0.25f,0.001f]},item_display:"gui"}

execute if data storage simpledrawer:main temp.item_stored run data modify storage simpledrawer:main temp.item_stored.count set value 1
data modify entity @s item set from storage simpledrawer:main temp.item_stored
