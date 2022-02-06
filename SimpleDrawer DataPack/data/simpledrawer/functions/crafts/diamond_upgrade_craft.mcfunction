#craft detection reset
advancement revoke @s only simpledrawer:diamond_upgrade_craft
advancement grant @s only simpledrawer:upgrade/diamond
recipe take @s simpledrawer:diamond_upgrade_craft
clear @s minecraft:knowledge_book 1

#summon item with UUID
summon item ~ ~ ~ {Tags:["SD_summoned"],Item:{id:"minecraft:stone",Count:1b}}
data modify entity @e[type=item,tag=SD_summoned,limit=1,sort=nearest] Item set from storage simpledrawer:temp ItemsNBT.Upgrades.diamond
data modify entity @e[type=item,tag=SD_summoned,limit=1,sort=nearest] Owner set from entity @s UUID
tag @e remove SD_summoned
