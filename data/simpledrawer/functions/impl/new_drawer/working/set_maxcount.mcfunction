

data modify storage simpledrawer:main temp.type set from entity @s Item.tag.simpledrawer.type

execute if data storage simpledrawer:main temp{type:"wood"} run scoreboard players set @s simpledrawer.drawer.maxCount 256
execute if data storage simpledrawer:main temp{type:"iron"} run scoreboard players set @s simpledrawer.drawer.maxCount 2048
execute if data storage simpledrawer:main temp{type:"gold"} run scoreboard players set @s simpledrawer.drawer.maxCount 8192
execute if data storage simpledrawer:main temp{type:"diamond"} run scoreboard players set @s simpledrawer.drawer.maxCount 65536
execute if data storage simpledrawer:main temp{type:"star"} run scoreboard players set @s simpledrawer.drawer.maxCount 1048576
execute if data storage simpledrawer:main temp{type:"netherite"} run scoreboard players set @s simpledrawer.drawer.maxCount 1073741824

scoreboard players operation #maxCount simpledrawer.math = @s simpledrawer.drawer.maxCount
scoreboard players operation #maxCount simpledrawer.math /= @s simpledrawer.drawer.nb_enabled

scoreboard players operation @s simpledrawer.drawer.maxCount0 = #maxCount simpledrawer.math
scoreboard players operation @s simpledrawer.drawer.maxCount1 = #maxCount simpledrawer.math
scoreboard players operation @s simpledrawer.drawer.maxCount2 = #maxCount simpledrawer.math
scoreboard players operation @s simpledrawer.drawer.maxCount3 = #maxCount simpledrawer.math
scoreboard players operation @s simpledrawer.drawer.maxCount4 = #maxCount simpledrawer.math
scoreboard players operation @s simpledrawer.drawer.maxCount5 = #maxCount simpledrawer.math
