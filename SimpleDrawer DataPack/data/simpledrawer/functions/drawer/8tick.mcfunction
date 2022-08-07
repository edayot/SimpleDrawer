
execute if entity @s[tag=simpledrawer.drawer.filled] positioned ~ ~-1 ~ if block ~ ~ ~ hopper[enabled=true] run function simpledrawer:drawer/working/hopper_extract/main

execute if score @s simpledrawer.drawer.Count < @s simpledrawer.drawer.maxCount positioned ~ ~1 ~ if block ~ ~ ~ hopper[facing=down,enabled=true] run function simpledrawer:drawer/working/hopper_insert/main
execute if score @s simpledrawer.drawer.Count < @s simpledrawer.drawer.maxCount positioned ~1 ~ ~ if block ~ ~ ~ hopper[facing=west,enabled=true] run function simpledrawer:drawer/working/hopper_insert/main
execute if score @s simpledrawer.drawer.Count < @s simpledrawer.drawer.maxCount positioned ~-1 ~ ~ if block ~ ~ ~ hopper[facing=east,enabled=true] run function simpledrawer:drawer/working/hopper_insert/main
execute if score @s simpledrawer.drawer.Count < @s simpledrawer.drawer.maxCount positioned ~ ~ ~-1 if block ~ ~ ~ hopper[facing=south,enabled=true] run function simpledrawer:drawer/working/hopper_insert/main
execute if score @s simpledrawer.drawer.Count < @s simpledrawer.drawer.maxCount positioned ~ ~ ~1 if block ~ ~ ~ hopper[facing=north,enabled=true] run function simpledrawer:drawer/working/hopper_insert/main

execute if entity @s[tag=simpledrawer.drawer.to_update] if entity @p[distance=..5] run function simpledrawer:drawer/working/display/count_2

scoreboard players add @a simpledrawer.player.input_cooldown 0
scoreboard players add @a simpledrawer.player.output_cooldown 0
