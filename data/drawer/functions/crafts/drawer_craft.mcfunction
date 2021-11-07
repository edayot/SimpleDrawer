#craft detection reset
advancement revoke @s only drawer:drawer_craft
recipe take @s drawer:drawer_craft
clear @s minecraft:knowledge_book 1

#summon item with UUID

function drawer:summon
data modify entity @e[type=item,tag=SD_summoned,limit=1,sort=nearest] Owner set from entity @s UUID
tag @e remove SD_summoned