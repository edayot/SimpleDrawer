#craft detection reset
advancement revoke @s only simpledrawer:drawer_craft
recipe take @s simpledrawer:drawer_craft
clear @s minecraft:knowledge_book 1

#summon item with UUID

function simpledrawer:summon
data modify entity @e[type=item,tag=SD_summoned,limit=1,sort=nearest] Owner set from entity @s UUID
tag @e remove SD_summoned