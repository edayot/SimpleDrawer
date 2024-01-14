$execute unless data storage dork.base64.encode:storage section_encodes."$(chars)" run scoreboard players set .success dork.temp 0
execute if score .success dork.temp matches 0 run return 0

data modify storage dork.base64:temp args.encode.converted set value ""
$data modify storage dork.base64:temp args.encode.converted set from storage dork.base64.encode:storage section_encodes."$(chars)"
function dork.base64:impl/encode/concatenate with storage dork.base64:temp args.encode

data modify storage dork.base64:temp args.encode.converting set string storage dork.base64:temp args.encode.converting 3
scoreboard players remove .chars_remaining dork.temp 3
scoreboard players add .index dork.temp 3

execute if score .chars_remaining dork.temp matches 1 run data modify storage dork.base64:temp args.encode.chars set string storage dork.base64:temp args.encode.converting 0 1
execute if score .chars_remaining dork.temp matches 2 run data modify storage dork.base64:temp args.encode.chars set string storage dork.base64:temp args.encode.converting 0 2
execute if score .chars_remaining dork.temp matches 3.. run data modify storage dork.base64:temp args.encode.chars set string storage dork.base64:temp args.encode.converting 0 3

execute if score .index dork.temp < .length dork.temp run function dork.base64:impl/encode/loop with storage dork.base64:temp args.encode