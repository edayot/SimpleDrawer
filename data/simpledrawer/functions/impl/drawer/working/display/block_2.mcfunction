scoreboard players set #model simpledrawer.math 1430000
execute if data storage simpledrawer:main temp{hopper:1b} run scoreboard players add #model simpledrawer.math 2
execute if data storage simpledrawer:main temp{type:"iron"} run scoreboard players add #model simpledrawer.math 4
execute if data storage simpledrawer:main temp{type:"gold"} run scoreboard players add #model simpledrawer.math 8
execute if data storage simpledrawer:main temp{type:"diamond"} run scoreboard players add #model simpledrawer.math 12
execute if data storage simpledrawer:main temp{type:"star"} run scoreboard players add #model simpledrawer.math 16
execute if data storage simpledrawer:main temp{type:"netherite"} run scoreboard players add #model simpledrawer.math 20

tag @s remove simpledrawer.drawer.hopper
execute if data storage simpledrawer:main temp{hopper:1b} run tag @s add simpledrawer.drawer.hopper

execute store result entity @s Item.tag.CustomModelData int 1 run scoreboard players get #model simpledrawer.math

