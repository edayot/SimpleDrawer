# arguments: input

$data modify storage dork.base64:io decode.input set value "$(input)" 
scoreboard players set .check_for_terminator dork.temp 0
function dork.base64:impl/decode/main

execute if score .success dork.temp matches 1 run return 1
return 0
