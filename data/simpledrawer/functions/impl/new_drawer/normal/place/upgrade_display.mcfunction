
tag @s add global.ignore
tag @s add simpledrawer.new_drawer.part
tag @s add simpledrawer.new_drawer.part.upgrade_display

tag @s add smithed.entity
tag @s add smithed.strict

scoreboard players operation @s simpledrawer.new_drawer.id = #global simpledrawer.new_drawer.id


tp @s ~ ~ ~ ~180 ~
data merge entity @s {transformation:{scale:[0.125f,0.125f,0.001f]},item_display:"gui"}

data modify storage simpledrawer:main temp.item_stored.Count set value 1b
data modify entity @s item set value {id:"minecraft:air",Count:1b}

execute if data storage simpledrawer:main temp.item.tag.simpledrawer{upgrade:"iron"} run data modify entity @s item set from storage simpledrawer:main ItemsNBT.iron_upgrade
execute if data storage simpledrawer:main temp.item.tag.simpledrawer{upgrade:"gold"} run data modify entity @s item set from storage simpledrawer:main ItemsNBT.gold_upgrade
execute if data storage simpledrawer:main temp.item.tag.simpledrawer{upgrade:"diamond"} run data modify entity @s item set from storage simpledrawer:main ItemsNBT.diamond_upgrade
execute if data storage simpledrawer:main temp.item.tag.simpledrawer{upgrade:"star"} run data modify entity @s item set from storage simpledrawer:main ItemsNBT.star_upgrade
execute if data storage simpledrawer:main temp.item.tag.simpledrawer{upgrade:"netherite"} run data modify entity @s item set from storage simpledrawer:main ItemsNBT.netherite_upgrade





