execute as @e[type=glow_item_frame,tag=simpledrawer.drawer.item] at @s run function simpledrawer:impl/drawer/tick

execute as @e[tag=simpledrawer.block,predicate=!simpledrawer:destroyer_beehive] at @s run function simpledrawer:impl/destroy_repart



execute as @a run function simpledrawer:impl/tick_player
schedule function simpledrawer:impl/tick 1t replace
