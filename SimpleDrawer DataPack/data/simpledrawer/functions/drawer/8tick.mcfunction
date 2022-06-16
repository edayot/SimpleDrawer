execute store result score #count simpledrawer.math run data get entity @s Item.tag.simpledrawer.Item.Count

execute if score #count simpledrawer.math < @s simpledrawer.drawer.maxCount positioned ~ ~1 ~ if block ~ ~ ~ hopper[facing=down,enabled=true] run function simpledrawer:drawer/working/hopper_insert/main
execute if score #count simpledrawer.math < @s simpledrawer.drawer.maxCount positioned ~1 ~ ~ if block ~ ~ ~ hopper[facing=west,enabled=true] run function simpledrawer:drawer/working/hopper_insert/main
execute if score #count simpledrawer.math < @s simpledrawer.drawer.maxCount positioned ~-1 ~ ~ if block ~ ~ ~ hopper[facing=east,enabled=true] run function simpledrawer:drawer/working/hopper_insert/main
execute if score #count simpledrawer.math < @s simpledrawer.drawer.maxCount positioned ~ ~ ~-1 if block ~ ~ ~ hopper[facing=south,enabled=true] run function simpledrawer:drawer/working/hopper_insert/main
execute if score #count simpledrawer.math < @s simpledrawer.drawer.maxCount positioned ~ ~ ~1 if block ~ ~ ~ hopper[facing=north,enabled=true] run function simpledrawer:drawer/working/hopper_insert/main


execute if entity @s[tag=simpledrawer.drawer.filled] positioned ~ ~-1 ~ if block ~ ~ ~ hopper[enabled=true] run function simpledrawer:drawer/working/hopper_extract/main
