#craft detection reset
advancement revoke @s only simpledrawerdrawer_craft
recipe take @s simpledrawerdrawer_craft
clear @s minecraft:knowledge_book 1

#summon item with UUID

function simpledrawersummon
data modify entity @e[type=item,tag=SD_summoned,limit=1,sort=nearest] Owner set from entity @s UUID
tag @e remove SD_summoned