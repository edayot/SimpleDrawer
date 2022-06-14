tag @s remove simpledrawer.summoned
tag @s remove simpledrawer.summoned2

tag @s add simpledrawer.block
tag @s add simpledrawer.drawer.item
tag @s add simpledrawer.drawer



data modify entity @s Item set from storage simpledrawer:main temp.ItemPlaced

execute if data storage simpledrawer:main temp.ItemPlaced.tag.simpledrawer.Item run tag @s add simpledrawer.drawer.filled

execute if data storage simpledrawer:main temp.ItemPlaced.tag.simpledrawer{type:"wood"} run scoreboard players set @s simpledrawer.drawer.maxCount 256
execute if data storage simpledrawer:main temp.ItemPlaced.tag.simpledrawer{type:"iron"} run scoreboard players set @s simpledrawer.drawer.maxCount 2048
execute if data storage simpledrawer:main temp.ItemPlaced.tag.simpledrawer{type:"gold"} run scoreboard players set @s simpledrawer.drawer.maxCount 8192
execute if data storage simpledrawer:main temp.ItemPlaced.tag.simpledrawer{type:"diamond"} run scoreboard players add #model simpledrawer.math 65536
execute if data storage simpledrawer:main temp.ItemPlaced.tag.simpledrawer{type:"star"} run scoreboard players add #model simpledrawer.math 1048576
execute if data storage simpledrawer:main temp.ItemPlaced.tag.simpledrawer{type:"netherite"} run scoreboard players add #model simpledrawer.math 1073741824
