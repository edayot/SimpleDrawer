data modify storage simpledrawer:io input set from storage itemio:io input
function simpledrawer:drawer/working/input_block
scoreboard players operation #count_to_remove itemio.math.input = #count_insert simpledrawer.io
scoreboard players operation #success_input itemio.math.input = #success simpledrawer.io
data modify storage itemio:io output set from storage simpledrawer:io output
