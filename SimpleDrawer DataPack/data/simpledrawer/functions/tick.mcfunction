

execute as @e[type=glow_item_frame,tag=simpledrawer.drawer.item,predicate=simpledrawer:air_blocks] run data modify entity @s Fixed set value 1b
execute as @e[type=glow_item_frame,tag=simpledrawer.drawer.item,predicate=!simpledrawer:air_blocks] run data modify entity @s Fixed set value 0b

execute as @e[type=glow_item_frame,tag=simpledrawer.drawer.block,predicate=!simpledrawer:destroyer] at @s run function simpledrawer:drawer/destroy

schedule function simpledrawer:tick 1t replace