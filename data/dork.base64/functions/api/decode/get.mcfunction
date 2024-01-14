# arguments: input

$data modify storage dork.base64:io decode.input set value "$(input)" 
scoreboard players set .check_for_terminator dork.temp 0
function dork.base64:impl/decode/main
$data modify storage dork.base64:io decode.input set value "$(input)"

execute if score .success dork.temp matches 1 run function dork.base64:impl/decode/display_get with storage dork.base64:temp args.decode
execute if score .success dork.temp matches 1 run return 1

execute store result score .start_index dork.temp store result score .end_index dork.temp run scoreboard players get .index dork.temp
execute store result storage dork.base64:temp args.decode.end_index int 1 run scoreboard players add .end_index dork.temp 1
scoreboard players remove .start_index dork.temp 10
execute if score .start_index dork.temp matches ..-1 run scoreboard players set .start_index dork.temp 0
execute store result storage dork.base64:temp args.decode.start_index int 1 run scoreboard players get .start_index dork.temp

function dork.base64:impl/decode/get_error_message with storage dork.base64:temp args.decode
execute if score .start_index dork.temp matches 0 run tellraw @s [{"text":"Invalid character at position ","color":"red"},{"score":{"name":".index","objective":"dork.temp"}},": ",{"storage":"dork.base64:temp","nbt":"section"},"<--[HERE]"]
execute if score .start_index dork.temp matches 1.. run tellraw @s [{"text":"Invalid character at position ","color":"red"},{"score":{"name":".index","objective":"dork.temp"}},": ...",{"storage":"dork.base64:temp","nbt":"section"},"<--[HERE]"]

return 0
