data modify storage simpledrawer:main temp.type set from entity @s Item.tag.simpledrawer.type
data modify storage simpledrawer:main temp.hopper set from entity @s Item.tag.simpledrawer.hopper


scoreboard players operation #test_id simpledrawer.math = @s simpledrawer.id
execute at @s as @e[type=minecraft:glow_item_frame,tag=simpledrawer.drawer.block,distance=..2] if score @s simpledrawer.id = #test_id simpledrawer.math run function simpledrawer:impl/drawer/working/display/block_2
