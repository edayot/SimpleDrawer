execute as @e[type=glow_item_frame,tag=simpledrawer.drawer.item] at @s run function simpledrawer:impl/drawer/tick

execute as @e[type=glow_item_frame,tag=simpledrawer.drawer.block,predicate=!simpledrawer:destroyer_beehive] at @s run function simpledrawer:impl/drawer/destroy



execute as @a run function simpledrawer:impl/tick_player
schedule function simpledrawer:impl/tick 1t replace
