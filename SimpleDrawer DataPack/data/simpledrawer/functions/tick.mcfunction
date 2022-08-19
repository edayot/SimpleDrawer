execute as @e[type=glow_item_frame,tag=simpledrawer.drawer.item] at @s run function simpledrawer:drawer/tick

execute as @e[type=glow_item_frame,tag=simpledrawer.drawer.block,predicate=!simpledrawer:destroyer_beehive] at @s run function simpledrawer:drawer/destroy



execute as @a run function simpledrawer:tick_player
schedule function simpledrawer:tick 1t replace
