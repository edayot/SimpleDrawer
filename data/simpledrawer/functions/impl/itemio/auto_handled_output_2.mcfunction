data modify storage itemio:io Item_auto_output set value {}
function simpledrawer:impl/drawer/working/get_item_block

scoreboard players set #if_empty_output simpledrawer.math 0
execute if data storage simpledrawer:io output{id:"minecraft:air"} run scoreboard players set #if_empty_output simpledrawer.math 1

execute if score #if_empty_output simpledrawer.math matches 0 run data modify storage itemio:io Item_auto_output set from storage simpledrawer:io output
execute if score #if_empty_output simpledrawer.math matches 0 run function #itemio:calls/auto_handled_output
execute if score #if_empty_output simpledrawer.math matches 0 run scoreboard players operation #count simpledrawer.io = #remove_count itemio.math.output
execute if score #if_empty_output simpledrawer.math matches 0 if score #success_output itemio.io matches 1 run function simpledrawer:impl/drawer/working/output_block


