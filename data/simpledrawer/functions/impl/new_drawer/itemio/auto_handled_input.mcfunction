
data modify storage simpledrawer:io input set from storage itemio:io input
# Checking all the slots
scoreboard players set #slot simpledrawer.io -1 

function simpledrawer:impl/new_drawer/working/io/input





execute if score #success simpledrawer.io matches 1 run scoreboard players operation #count_to_remove itemio.math.input = #count_insert simpledrawer.io
execute if score #success simpledrawer.io matches 1 run scoreboard players set #success_input itemio.math.input 0
execute if score #success simpledrawer.io matches 1 run scoreboard players set #success_input itemio.math.input 1
execute if score #success simpledrawer.io matches 1 run data modify storage itemio:io output set from storage simpledrawer:io output



execute if score #success simpledrawer.io matches 0 if score #servos_transfer itemio.math matches 1 run function #itemio:calls/disable_servo
