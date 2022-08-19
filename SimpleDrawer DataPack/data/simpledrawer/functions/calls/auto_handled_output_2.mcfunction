data modify storage itemio:io Item_auto_output set value {}
function simpledrawer:drawer/working/get_item_block
data modify storage itemio:io Item_auto_output set from storage simpledrawer:io output

function #itemio:calls/auto_handled_output
scoreboard players operation #count simpledrawer.io = #remove_count itemio.math.output
execute if score #success_output itemio.math.output matches 1 run function simpledrawer:drawer/working/output_block


