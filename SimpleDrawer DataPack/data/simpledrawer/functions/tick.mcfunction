

execute as @e[tag=simpledrawer.drawer.item,predicate=simpledrawer:air_blocks] run data modify entity @s Fixed set value 1b
execute as @e[tag=simpledrawer.drawer.item,predicate=!simpledrawer:air_blocks] run data modify entity @s Fixed set value 0b

schedule function simpledrawer:tick 1t replace