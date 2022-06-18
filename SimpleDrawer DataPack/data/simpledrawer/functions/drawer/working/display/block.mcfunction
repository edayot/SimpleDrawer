data modify storage simpledrawer:main temp.type set from entity @s Item.tag.simpledrawer.type
data modify storage simpledrawer:main temp.hopper set from entity @s Item.tag.simpledrawer.hopper


scoreboard players operation #test_id simpledrawer.math = @s simpledrawer.id
execute as @e[type=minecraft:glow_item_frame,tag=simpledrawer.drawer.block] if score @s simpledrawer.id = #test_id simpledrawer.math run function simpledrawer:drawer/working/display/block_2
