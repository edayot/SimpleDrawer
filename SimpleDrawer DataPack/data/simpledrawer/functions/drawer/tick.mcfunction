scoreboard players set #me simpledrawer.math 0
tag @s add simpledrawer.drawer.item.me
execute if entity @a[predicate=simpledrawer:is_looking_me,distance=..7] run scoreboard players set #me simpledrawer.math 1
tag @s remove simpledrawer.drawer.item.me


execute if score #me simpledrawer.math matches 1 if predicate simpledrawer:fixed_free_blocks unless predicate simpledrawer:shulker_box_around unless entity @e[type=shulker,distance=..1.8] run data modify entity @s Fixed set value 0b


execute if score #me simpledrawer.math matches 0 run data modify entity @s Fixed set value 1b
execute unless predicate simpledrawer:fixed_free_blocks run data modify entity @s Fixed set value 1b
execute if predicate simpledrawer:shulker_box_around run data modify entity @s Fixed set value 1b
execute if entity @e[type=shulker,distance=..1.8] run data modify entity @s Fixed set value 1b



execute if entity @s[tag=simpledrawer.drawer.hopper,tag=simpledrawer.drawer.filled] positioned ^ ^ ^-1 run function simpledrawer:drawer/working/minecart_hopper_extract/test
