
tag @s add global.ignore
tag @s add simpledrawer.new_drawer.part
tag @s add simpledrawer.new_drawer.part.upgrade_display

tag @s add smithed.entity
tag @s add smithed.strict

scoreboard players operation @s simpledrawer.new_drawer.id = #place_id simpledrawer.math


tp @s ~ ~ ~ ~180 ~
data merge entity @s {transformation:{scale:[0.125f,0.125f,0.001f]},item_display:"gui"}

data modify storage simpledrawer:main temp.item_stored.count set value 1
data modify entity @s item set value {id:"minecraft:air",count:1}

execute if data storage simpledrawer:main temp.item.components."minecraft:custom_data".simpledrawer{upgrade:"iron"} run loot replace entity @s container.0 loot simpledrawer:impl/items/iron_upgrade
execute if data storage simpledrawer:main temp.item.components."minecraft:custom_data".simpledrawer{upgrade:"gold"} run loot replace entity @s container.0 loot simpledrawer:impl/items/gold_upgrade
execute if data storage simpledrawer:main temp.item.components."minecraft:custom_data".simpledrawer{upgrade:"diamond"} run loot replace entity @s container.0 loot simpledrawer:impl/items/diamond_upgrade
execute if data storage simpledrawer:main temp.item.components."minecraft:custom_data".simpledrawer{upgrade:"star"} run loot replace entity @s container.0 loot simpledrawer:impl/items/star_upgrade
execute if data storage simpledrawer:main temp.item.components."minecraft:custom_data".simpledrawer{upgrade:"netherite"} run loot replace entity @s container.0 loot simpledrawer:impl/items/netherite_upgrade





