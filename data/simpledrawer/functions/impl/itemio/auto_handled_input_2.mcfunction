data modify storage simpledrawer:io input set from storage itemio:io input
function simpledrawer:impl/drawer/working/input_block
scoreboard players operation #count_to_remove itemio.io = #count_insert simpledrawer.io
scoreboard players operation #success_input itemio.io = #success simpledrawer.io
data modify storage itemio:io output set from storage simpledrawer:io output

execute if score #servos_transfer itemio.math matches 1 if score #nothing_changed simpledrawer.io matches 1 run function #itemio:calls/disable_servo
execute if score #servos_transfer itemio.math matches 1 if score #nothing_changed simpledrawer.io matches 0 if score #success simpledrawer.io matches 0 run function #itemio:calls/disable_servo