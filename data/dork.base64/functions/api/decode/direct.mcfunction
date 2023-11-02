scoreboard players set .check_for_terminator dork.temp 0
execute if data storage dork.base64:io decode.input run function dork.base64:impl/decode/main

execute if score .success dork.temp matches 1 run return 1
return 0
