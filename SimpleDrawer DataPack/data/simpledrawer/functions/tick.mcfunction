execute as @e[type=glow_item_frame,tag=simpledrawer.drawer.item] at @s run function simpledrawer:drawer/tick

execute as @e[type=glow_item_frame,tag=simpledrawer.drawer.block,predicate=!simpledrawer:destroyer_beehive] at @s run function simpledrawer:drawer/destroy

execute as @e[tag=simpledrawer.minecart_checked] at @s positioned ~ ~1 ~ unless entity @e[type=glow_item_frame,tag=simpledrawer.drawer_connector,distance=..1] run function simpledrawer:drawer_connector/minecart_protection/reset
execute as @e[type=glow_item_frame,tag=simpledrawer.drawer_connector] at @s run function simpledrawer:drawer_connector/tick

execute as @e[type=glow_item_frame,tag=simpledrawer.drawer_connector,predicate=!simpledrawer:destroyer_barrel] at @s run function simpledrawer:drawer_connector/destroy

clear @a stone{simpledrawer:{gui:1b}}
scoreboard players remove @a[scores={simpledrawer.player.output_cooldown=1..}] simpledrawer.player.output_cooldown 1
scoreboard players remove @a[scores={simpledrawer.player.input_cooldown=1..}] simpledrawer.player.input_cooldown 1

schedule function simpledrawer:tick 1t replace
