# same as the input function but it's the block
scoreboard players set #success simpledrawer.io 0
scoreboard players operation #test_id simpledrawer.math = @s simpledrawer.id
execute at @s as @e[type=minecraft:glow_item_frame,tag=simpledrawer.drawer.item,distance=..1] if score @s simpledrawer.id = #test_id simpledrawer.math run function simpledrawer:impl/drawer/working/input_nofirst
