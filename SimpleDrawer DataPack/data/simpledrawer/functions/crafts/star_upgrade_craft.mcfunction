#craft detection reset
advancement revoke @s only simpledrawer:star_upgrade_craft
advancement grant @s only simpledrawer:upgrade/star
recipe take @s simpledrawer:star_upgrade_craft
clear @s minecraft:knowledge_book 1

#summon item with UUID
loot give @s loot simpledrawer:items/upgrade/star
