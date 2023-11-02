$execute unless data storage dork.base64:global digit_to_binary."$(char)" run scoreboard players set .success dork.temp 0
execute if score .success dork.temp matches 0 run return 0

data modify storage dork.base64:temp args.decode.converted set value ""
$data modify storage dork.base64:temp args.decode.converted set from storage dork.base64:global digit_to_binary."$(char)"
function dork.base64:impl/decode/try_convert with storage dork.base64:temp args.decode

# repeat
data modify storage dork.base64:temp args.decode.char set string storage dork.base64:io decode.input 0 1
data modify storage dork.base64:io decode.input set string storage dork.base64:io decode.input 1
scoreboard players add .index dork.temp 1
execute if score .index dork.temp < .length dork.temp if score .continue dork.temp matches 1 run function dork.base64:impl/decode/loop with storage dork.base64:temp args.decode
