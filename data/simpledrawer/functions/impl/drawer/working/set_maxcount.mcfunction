

data modify storage simpledrawer:main temp.type set from entity @s Item.tag.simpledrawer.type

execute if data storage simpledrawer:main temp{type:"wood"} run scoreboard players set @s simpledrawer.drawer.maxCount 256
execute if data storage simpledrawer:main temp{type:"iron"} run scoreboard players set @s simpledrawer.drawer.maxCount 2048
execute if data storage simpledrawer:main temp{type:"gold"} run scoreboard players set @s simpledrawer.drawer.maxCount 8192
execute if data storage simpledrawer:main temp{type:"diamond"} run scoreboard players set @s simpledrawer.drawer.maxCount 65536
execute if data storage simpledrawer:main temp{type:"star"} run scoreboard players set @s simpledrawer.drawer.maxCount 1048576
execute if data storage simpledrawer:main temp{type:"netherite"} run scoreboard players set @s simpledrawer.drawer.maxCount 1073741824