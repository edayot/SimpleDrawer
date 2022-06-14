
data modify storage simpledrawer:main temp.simpledrawer set from entity @s Item.tag.simpledrawer
data remove storage simpledrawer:main temp.simpledrawer.Item
data modify entity @s Item set value {id:"minecraft:barrier",Count:1b,tag:{simpledrawer:{type:"wood",hopper:0}}}
data modify entity @s Item.tag.simpledrawer set from storage simpledrawer:main temp.simpledrawer


#IO compatibility
data modify storage simpledrawer:io success set value 1
data modify storage simpledrawer:io output set from storage simpledrawer:io input
execute store result storage simpledrawer:io output.Count long 1 run scoreboard players get #count_drawer simpledrawer.math
tag @s remove simpledrawer.drawer.filled