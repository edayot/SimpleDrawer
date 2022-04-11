#craft detection reset
advancement revoke @s only simpledrawer:hopper_upgrade_craft
recipe take @s simpledrawer:hopper_upgrade_craft
clear @s minecraft:knowledge_book 1

#summon item with UUID
loot give @s loot simpledrawer:items/upgrade/hopper
