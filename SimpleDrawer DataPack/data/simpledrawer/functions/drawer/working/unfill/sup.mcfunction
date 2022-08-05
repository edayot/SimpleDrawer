data modify storage simpledrawer:io output set from entity @s Item.tag.simpledrawer.Item


data modify storage simpledrawer:main temp.simpledrawer set from entity @s Item.tag.simpledrawer
data remove storage simpledrawer:main temp.simpledrawer.Item
data modify entity @s Item set value {id:"minecraft:barrier",Count:1b,tag:{simpledrawer:{type:"wood",hopper:0}}}
data modify entity @s Item.tag.simpledrawer set from storage simpledrawer:main temp.simpledrawer



#IO compatibility

scoreboard players set #success simpledrawer.io 1
execute store result storage simpledrawer:io output.Count int 1 run scoreboard players get @s simpledrawer.drawer.Count
scoreboard players operation #count_output simpledrawer.io = @s simpledrawer.drawer.Count
tag @s remove simpledrawer.drawer.filled
scoreboard players set @s simpledrawer.drawer.Count 0

function simpledrawer:drawer/working/display/count