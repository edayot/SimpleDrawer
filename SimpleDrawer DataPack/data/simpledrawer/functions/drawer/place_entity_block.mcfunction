tag @s remove simpledrawer.summoned
tag @s remove simpledrawer.summoned1

tag @s add simpledrawer.block
tag @s add simpledrawer.drawer.block
tag @s add simpledrawer.drawer


scoreboard players set #model simpledrawer.math 1430000

scoreboard players set #model simpledrawer.math 1430000
execute if data storage simpledrawer:main temp.ItemPlaced.tag.simpledrawer{hopper:1} run scoreboard players add #model simpledrawer.math 2
execute if data storage simpledrawer:main temp.ItemPlaced.tag.simpledrawer{type:"iron"} run scoreboard players add #model simpledrawer.math 4
execute if data storage simpledrawer:main temp.ItemPlaced.tag.simpledrawer{type:"gold"} run scoreboard players add #model simpledrawer.math 8
execute if data storage simpledrawer:main temp.ItemPlaced.tag.simpledrawer{type:"diamond"} run scoreboard players add #model simpledrawer.math 12
execute if data storage simpledrawer:main temp.ItemPlaced.tag.simpledrawer{type:"star"} run scoreboard players add #model simpledrawer.math 16
execute if data storage simpledrawer:main temp.ItemPlaced.tag.simpledrawer{type:"netherite"} run scoreboard players add #model simpledrawer.math 20

execute store result entity @s Item.tag.CustomModelData int 1 run scoreboard players get #model simpledrawer.math
