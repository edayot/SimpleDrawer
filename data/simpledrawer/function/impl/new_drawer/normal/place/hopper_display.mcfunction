
tag @s add global.ignore
tag @s add simpledrawer.new_drawer.part
tag @s add simpledrawer.new_drawer.part.hopper_display

tag @s add smithed.entity
tag @s add smithed.strict

scoreboard players operation @s simpledrawer.new_drawer.id = #place_id simpledrawer.math


tp @s ~ ~ ~ ~180 ~
data merge entity @s {transformation:{scale:[0.125f,0.125f,0.001f]},item_display:"gui"}

execute if data storage simpledrawer:main temp.item.components."minecraft:custom_data".simpledrawer{hopper:1b} run loot replace entity @s container.0 loot simpledrawer:impl/items/hopper_upgrade
