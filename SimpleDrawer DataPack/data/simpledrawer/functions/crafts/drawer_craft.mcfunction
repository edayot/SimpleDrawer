#craft detection reset
advancement revoke @s only simpledrawer:drawer_craft
recipe take @s simpledrawer:drawer_craft
clear @s minecraft:knowledge_book 1

#summon item with UUID

summon item ~ ~ ~ {Tags:["simpledrawer.summoned"],Item:{id:"minecraft:stone",Count:1b}}
data modify entity @e[type=item,tag=simpledrawer.summoned,limit=1,sort=nearest] Item set from storage simpledrawer:temp ItemsNBT.drawer
data modify entity @e[type=item,tag=simpledrawer.summoned,limit=1,sort=nearest] Owner set from entity @s UUID
tag @e remove simpledrawer.summoned