# arguments: input

$data modify storage dork.base64:io encode.input set value "$(input)"
scoreboard players set .check_for_terminator dork.temp 0
function dork.base64:impl/encode/main
$data modify storage dork.base64:io encode.input set value "$(input)"

execute if score .success dork.temp matches 1 run function dork.base64:impl/encode/display_get with storage dork.base64:io encode
execute if score .success dork.temp matches 1 run return 1

$data modify storage dork.base64:io encode.input set value "$(input)"
function dork.base64:impl/encode/get_error_message with storage dork.base64:temp args.encode
tellraw @s [{"text":"Invalid character found in input string.","color":"red"}]
return 0
