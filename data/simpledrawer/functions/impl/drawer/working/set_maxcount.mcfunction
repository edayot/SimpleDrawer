

data modify storage simpledrawer:main temp.type set from entity @s Item.tag.simpledrawer.type

execute if data storage simpledrawer:main temp{type:"wood"} store result score @s simpledrawer.drawer.maxCount run data get storage simpledrawer:main drawer_type.wood.maxCount
execute if data storage simpledrawer:main temp{type:"iron"} store result score @s simpledrawer.drawer.maxCount run data get storage simpledrawer:main drawer_type.iron.maxCount
execute if data storage simpledrawer:main temp{type:"gold"} store result score @s simpledrawer.drawer.maxCount run data get storage simpledrawer:main drawer_type.gold.maxCount
execute if data storage simpledrawer:main temp{type:"diamond"} store result score @s simpledrawer.drawer.maxCount run data get storage simpledrawer:main drawer_type.diamond.maxCount
execute if data storage simpledrawer:main temp{type:"star"} store result score @s simpledrawer.drawer.maxCount run data get storage simpledrawer:main drawer_type.star.maxCount
execute if data storage simpledrawer:main temp{type:"netherite"} store result score @s simpledrawer.drawer.maxCount run data get storage simpledrawer:main drawer_type.netherite.maxCount
