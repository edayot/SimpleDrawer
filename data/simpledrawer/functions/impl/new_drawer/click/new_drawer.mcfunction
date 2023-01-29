scoreboard players set #last simpledrawer.math -1
execute store result score #last simpledrawer.math run data get block ~ ~ ~ last_interacted_slot
function simpledrawer:impl/new_drawer/regen_books

#default behaviour
#scoreboard players operation #input_slot simpledrawer.io = #last simpledrawer.math

#Control config
# interact[6] = [mode,modes,mode,mode,mode,mode] 
# mode = {type, slot}
# type = 0 : clickable item
# type = 1 : upgrade slot
# slot = 0-5 : slot to interact with

data modify storage simpledrawer:main temp.interact set from entity @s Item.tag.simpledrawer.interact
scoreboard players set #input_slot simpledrawer.io -1
scoreboard players set #interact_type simpledrawer.math -1
scoreboard players set #filled simpledrawer.math -1

execute if score #last simpledrawer.math matches 0 run function simpledrawer:impl/new_drawer/click/new_drawer/0
execute if score #last simpledrawer.math matches 1 run function simpledrawer:impl/new_drawer/click/new_drawer/1
execute if score #last simpledrawer.math matches 2 run function simpledrawer:impl/new_drawer/click/new_drawer/2
execute if score #last simpledrawer.math matches 3 run function simpledrawer:impl/new_drawer/click/new_drawer/3
execute if score #last simpledrawer.math matches 4 run function simpledrawer:impl/new_drawer/click/new_drawer/4
execute if score #last simpledrawer.math matches 5 run function simpledrawer:impl/new_drawer/click/new_drawer/5

execute unless score #filled simpledrawer.math matches 1 if score #input_slot simpledrawer.io matches 0 store success score #filled simpledrawer.math if score @s simpledrawer.drawer.Count0 matches 1.. 
execute unless score #filled simpledrawer.math matches 1 if score #input_slot simpledrawer.io matches 1 store success score #filled simpledrawer.math if score @s simpledrawer.drawer.Count1 matches 1..
execute unless score #filled simpledrawer.math matches 1 if score #input_slot simpledrawer.io matches 2 store success score #filled simpledrawer.math if score @s simpledrawer.drawer.Count2 matches 1..
execute unless score #filled simpledrawer.math matches 1 if score #input_slot simpledrawer.io matches 3 store success score #filled simpledrawer.math if score @s simpledrawer.drawer.Count3 matches 1..
execute unless score #filled simpledrawer.math matches 1 if score #input_slot simpledrawer.io matches 4 store success score #filled simpledrawer.math if score @s simpledrawer.drawer.Count4 matches 1..
execute unless score #filled simpledrawer.math matches 1 if score #input_slot simpledrawer.io matches 5 store success score #filled simpledrawer.math if score @s simpledrawer.drawer.Count5 matches 1..



scoreboard players operation #last_id simpledrawer.math = @s simpledrawer.id
execute as @p[tag=simpledrawer.adder] unless score @s simpledrawer.player.last_id = #last_id simpledrawer.math run function simpledrawer:impl/drawer/click/reset_cooldown
scoreboard players operation @p[tag=simpledrawer.adder] simpledrawer.player.last_id = #last_id simpledrawer.math

scoreboard players set #already simpledrawer.math 0

execute if score #already simpledrawer.math matches 0 
    if score #interact_type simpledrawer.math matches 1 
    if data storage simpledrawer:main temp.ItemInput.tag.simpledrawer.upgrade
    run function simpledrawer:impl/new_drawer/click/repart/upgrade

execute if score #already simpledrawer.math matches 0 
    if score #interact_type simpledrawer.math matches 1 
    if data storage simpledrawer:main temp.ItemInput.tag.simpledrawer.downgrade
    run function simpledrawer:impl/new_drawer/click/repart/downgrade


execute if score #already simpledrawer.math matches 0 
    if score #interact_type simpledrawer.math matches 0 
    if score #filled_hand simpledrawer.math matches 1 
    if score @p[tag=simpledrawer.adder] simpledrawer.player.output_cooldown matches 0 
    if score @p[tag=simpledrawer.adder] simpledrawer.player.input_cooldown matches 0..5 
    run function simpledrawer:impl/new_drawer/click/repart/simple_fill

execute if score #already simpledrawer.math matches 0 
    if score #interact_type simpledrawer.math matches 0 
    if score #filled_hand simpledrawer.math matches 1
    if score @p[tag=simpledrawer.adder] simpledrawer.player.output_cooldown matches 1..5
    run function simpledrawer:impl/new_drawer/click/repart/simple_unfill

execute if score #already simpledrawer.math matches 0 
    if score #filled simpledrawer.math matches 1
    if score #interact_type simpledrawer.math matches 0 
    if score #filled_hand simpledrawer.math matches 0 
    if score @p[tag=simpledrawer.adder] simpledrawer.player.output_cooldown matches ..5
    run function simpledrawer:impl/new_drawer/click/repart/simple_unfill





tag @s remove simpledrawer.selected