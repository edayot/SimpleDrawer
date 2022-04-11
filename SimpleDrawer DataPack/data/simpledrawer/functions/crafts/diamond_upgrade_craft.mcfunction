#craft detection reset
advancement revoke @s only simpledrawer:diamond_upgrade_craft
advancement grant @s only simpledrawer:upgrade/diamond
recipe take @s simpledrawer:diamond_upgrade_craft
clear @s minecraft:knowledge_book 1

#summon item with UUID
loot give @s loot simpledrawer:items/upgrade/diamond
