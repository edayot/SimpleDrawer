tag @s add global.ignore
tag @s add simpledrawer.new_drawer.part
tag @s add simpledrawer.new_drawer.part.base_block

tag @s add smithed.entity
tag @s add smithed.strict

scoreboard players operation @s simpledrawer.new_drawer.id = #global simpledrawer.new_drawer.id

data modify storage simpledrawer:main temp.item set value {id:"minecraft:furnace",Count:1b,tag:{CustomModelData:1430000}}
tp @s ~ ~ ~ ~ ~

data modify entity @s item set from storage simpledrawer:main temp.item

data merge entity @s {transformation:{scale:[1.001f,1.001f,1.001f],translation:[0.0f,0.0f,-1.0f]}}


