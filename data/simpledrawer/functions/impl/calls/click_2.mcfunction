tag @s add simpledrawer.adder
playsound minecraft:entity.item_frame.add_item block @s ~ ~ ~
data remove storage simpledrawer:main temp.ItemInput
data modify storage simpledrawer:main temp.ItemInput set from entity @s SelectedItem

scoreboard players set #already simpledrawer.math 0

execute as @e[type=glow_item_frame,sort=nearest,predicate=!simpledrawer:not_rotated,distance=..7,tag=simpledrawer.drawer.item] at @s run function simpledrawer:impl/calls/click_3 

scoreboard players operation #last_id simpledrawer.math = @e[tag=simpledrawer.selected,limit=1] simpledrawer.id
execute unless score @s simpledrawer.player.last_id = #last_id simpledrawer.math run function simpledrawer:impl/calls/click_4 
scoreboard players operation @s simpledrawer.player.last_id = #last_id simpledrawer.math

scoreboard players set #exist simpledrawer.math 0
scoreboard players set #exist_filled simpledrawer.math 0
scoreboard players set #filled_hand simpledrawer.math 0
scoreboard players set #sneaking simpledrawer.math 0

execute store success score #exist simpledrawer.math if entity @e[tag=simpledrawer.selected]
execute store success score #exist_filled simpledrawer.math if entity @e[tag=simpledrawer.selected,tag=simpledrawer.drawer.filled]
execute store success score #filled_hand simpledrawer.math if data storage simpledrawer:main temp.ItemInput
execute store success score #sneaking simpledrawer.math if entity @s[predicate=simpledrawer:sneaking]

#Upgrade and downgrade system
execute if score #already simpledrawer.math matches 0 if score #exist simpledrawer.math matches 1 if score #sneaking simpledrawer.math matches 1 if data storage simpledrawer:main temp.ItemInput.tag.simpledrawer.downgrade run function simpledrawer:impl/drawer/working/repart/downgrade

execute if score #already simpledrawer.math matches 0 if score #exist simpledrawer.math matches 1 if score #sneaking simpledrawer.math matches 1 if data storage simpledrawer:main temp.ItemInput.tag.simpledrawer.upgrade run function simpledrawer:impl/drawer/working/repart/upgrade


#First checks fill unfill, bigfill and bigunfill
execute if score #already simpledrawer.math matches 0 if score #exist simpledrawer.math matches 1 if score #filled_hand simpledrawer.math matches 1 if score #sneaking simpledrawer.math matches 0 if score @s simpledrawer.player.output_cooldown matches 0 if score @s simpledrawer.player.input_cooldown matches 0..5 run function simpledrawer:impl/drawer/working/repart/simple_fill

execute if score #already simpledrawer.math matches 0 if score #exist simpledrawer.math matches 1 if score #filled_hand simpledrawer.math matches 1 if score #sneaking simpledrawer.math matches 0 if score @s simpledrawer.player.output_cooldown matches 1..5 run function simpledrawer:impl/drawer/working/repart/simple_unfill


execute if score #already simpledrawer.math matches 0 if score #exist_filled simpledrawer.math matches 1 if score #filled_hand simpledrawer.math matches 0 if score #sneaking simpledrawer.math matches 0 if score @s simpledrawer.player.output_cooldown matches ..5 run function simpledrawer:impl/drawer/working/repart/simple_unfill

execute if score #already simpledrawer.math matches 0 if score #exist_filled simpledrawer.math matches 1 if score #filled_hand simpledrawer.math matches 0 if score #sneaking simpledrawer.math matches 1 run function simpledrawer:impl/drawer/working/repart/big_unfill

execute if score #already simpledrawer.math matches 0 if score #exist_filled simpledrawer.math matches 1 if score #filled_hand simpledrawer.math matches 1 if score #sneaking simpledrawer.math matches 1 run function simpledrawer:impl/drawer/working/repart/big_fill

#Secondary fill
execute if score #already simpledrawer.math matches 0 if score #exist simpledrawer.math matches 1 if score #filled_hand simpledrawer.math matches 1 if score #sneaking simpledrawer.math matches 1 if score @s simpledrawer.player.input_cooldown matches 0..5 run function simpledrawer:impl/drawer/working/repart/simple_fill

#U
tag @e[tag=simpledrawer.selected] remove simpledrawer.selected
tag @s remove simpledrawer.adder
