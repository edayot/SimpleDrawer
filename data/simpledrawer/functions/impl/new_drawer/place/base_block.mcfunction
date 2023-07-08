tag @s add simpledrawer.new_drawer.part
tag @s add simpledrawer.new_drawer.part.base_block

scoreboard players operation @s simpledrawer.new_drawer.id = #global simpledrawer.new_drawer.id

data modify storage simpledrawer:main temp.item set value {id:"minecraft:furnace",Count:1b,tag:{CustomModelData:1430000}}
tp @s ~ ~ ~ ~ ~

data modify entity @s item set from storage simpledrawer:main temp.item

data merge entity @s {transformation:{scale:[1.01f,1.01f,1.01f],translation:[0.0f,0.0f,-1.0f]}}


