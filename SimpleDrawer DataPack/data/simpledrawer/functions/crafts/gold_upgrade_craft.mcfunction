#craft detection reset
advancement revoke @s only simpledrawer:gold_upgrade_craft
advancement grant @s only simpledrawer:upgrade/gold
recipe take @s simpledrawer:gold_upgrade_craft
clear @s minecraft:knowledge_book 1

#summon item with UUID
loot give @s loot simpledrawer:items/upgrade/gold
