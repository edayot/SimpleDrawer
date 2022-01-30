
scoreboard objectives remove SD_tempC
scoreboard objectives remove SD_sneak
scoreboard objectives remove SD_time
data remove storage simpledrawer:temp Loaded

execute in simpledrawer:intern run forceload remove 0 0
tag @a remove SD_book

tellraw @s [{"text":"[Simple Drawer Uninstall]"}]
tellraw @s [{"text":"You can delete the storage simpledrawer:temp in the map file"}]
tellraw @s [{"text":"You can kill all drawer in the word by /kill @e[tag=SD_DrawerItem] and /kill @e[tag=SD_DrawerBlock]"}]
tellraw @s [{"text":'Be aware datapack is not disable, to complete uninstall and remove the datapack do /datapack disable "file/..." (complete with datapack file name) '}]


