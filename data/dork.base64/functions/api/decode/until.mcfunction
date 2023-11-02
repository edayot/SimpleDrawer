# arguments: terminator, include_terminator (bool)

$scoreboard players set .include_terminator dork.temp $(include_terminator)
$data modify storage dork.base64:io decode.terminator set value "$(terminator)"
scoreboard players set .check_for_terminator dork.temp 1
execute if data storage dork.base64:io decode.input run function dork.base64:impl/decode/main

execute if score .success dork.temp matches 1 run return 1
return 0
