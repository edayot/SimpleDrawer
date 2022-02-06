
scoreboard objectives remove simpledrawer.tempC
scoreboard objectives remove simpledrawer.sneak
scoreboard objectives remove simpledrawer.time
data remove storage simpledrawer:temp Loaded

execute as @e[tag=simpledrawer.forceload,type=marker] run function simpledrawer:unforceload_try
tag @a remove simpledrawer.book

tellraw @s [{"text":"[Simple Drawer Uninstall]"}]
tellraw @s [{"text":"You can delete the storage simpledrawer:temp in the map file"}]
tellraw @s [{"text":"You can kill all drawer in the word by /kill @e[tag=simpledrawer.DrawerItem] and /kill @e[tag=simpledrawer.DrawerBlock]"}]
tellraw @s [{"text":"Be aware datapack is not disable, to complete uninstall and remove the datapack do /datapack disable \"file/...\" (complete with datapack file name) "}]