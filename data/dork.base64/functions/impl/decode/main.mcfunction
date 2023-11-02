# (storage dork.base64:io decode.input)

scoreboard players set .success dork.temp 1
execute store result score .length dork.temp run data get storage dork.base64:io decode.input
scoreboard players set .index dork.temp 0
scoreboard players set .continue dork.temp 1

data modify storage dork.base64:temp args.decode set value {output:"",binary:"","converted":"",terminator_length:1}
execute if score .check_for_terminator dork.temp matches 1 store result storage dork.base64:temp args.decode.terminator_length int 1 run data get storage dork.base64:io decode.terminator
data modify storage dork.base64:temp args.decode.char set string storage dork.base64:io decode.input 0 1
data modify storage dork.base64:io decode.input set string storage dork.base64:io decode.input 1
execute if score .index dork.temp < .length dork.temp positioned ~ -2000 ~ summon text_display run function dork.base64:impl/decode/init_entity

execute if score .success dork.temp matches 1 run data modify storage dork.base64:io decode.output set from storage dork.base64:temp args.decode.output
execute if score .success dork.temp matches 0 run data remove storage dork.base64:io decode.output
