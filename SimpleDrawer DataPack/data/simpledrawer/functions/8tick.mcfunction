#execute as @e[type=glow_item_frame,tag=simpledrawer.drawer.item,tag=simpledrawer.drawer.hopper] at @s positioned ^ ^ ^-1 run function simpledrawer:drawer/8tick
#execute as @e[type=glow_item_frame,tag=simpledrawer.drawer_connector] at @s run function simpledrawer:drawer_connector/8tick

schedule function simpledrawer:8tick 8t replace