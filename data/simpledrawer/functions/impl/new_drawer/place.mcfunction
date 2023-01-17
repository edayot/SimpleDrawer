

summon glow_item_frame ~ ~ ~ {Facing:1b,ItemRotation:4b,Invulnerable:1b,Tags:["simpledrawer.summoned"],Invisible:1b,Fixed:1b,Item:{id:"minecraft:beehive",Count:1b}}





function simpledrawer:impl/drawer/generate_id

data remove storage simpledrawer:main temp.ItemPlaced
data modify storage simpledrawer:main temp.ItemPlaced set from block ~ ~ ~ Items[0]
data remove storage simpledrawer:main temp.ItemPlaced.Slot

execute unless block ~ ~ ~ minecraft:furnace run setblock ~ ~ ~ minecraft:chiseled_bookshelf[facing=north,slot_0_occupied=true,slot_1_occupied=true,slot_2_occupied=true,slot_3_occupied=true,slot_4_occupied=true,slot_5_occupied=true]

execute as @e[type=glow_item_frame,tag=simpledrawer.summoned] at @s run function simpledrawer:impl/new_drawer/place_entity


