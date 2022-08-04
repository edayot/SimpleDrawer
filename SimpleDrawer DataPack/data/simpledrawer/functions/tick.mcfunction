execute as @e[type=glow_item_frame,tag=simpledrawer.drawer.item] at @s run function simpledrawer:drawer/tick

execute as @e[type=glow_item_frame,tag=simpledrawer.drawer.block,predicate=!simpledrawer:destroyer_beehive] at @s run function simpledrawer:drawer/destroy


execute as @e[type=glow_item_frame,tag=simpledrawer.drawer_connector] at @s run function simpledrawer:drawer_connector/tick

execute as @e[type=glow_item_frame,tag=simpledrawer.drawer_connector,predicate=!simpledrawer:destroyer_barrel] at @s run function simpledrawer:drawer_connector/destroy


schedule function simpledrawer:tick 1t replace
