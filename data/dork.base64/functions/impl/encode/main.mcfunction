# (storage dork.base64:io encode.input)
# dork.base64.encode:storage is a MASSIVE list of chars and their associated b64 values. it's a good idea to load it into memory.
data get storage dork.base64.encode:storage

scoreboard players set .success dork.temp 1
execute store result score .length dork.temp store result score .chars_remaining dork.temp run data get storage dork.base64:io encode.input
scoreboard players set .index dork.temp 0
scoreboard players set .continue dork.temp 1

# converting is purely used as a copy of input as it will iterate and remove 3 chars at a time.
data modify storage dork.base64:temp args.encode set value {output:"","converted":"",padding:"",converting:"",chars:""}

# Need to check for amount of padding.
scoreboard players operation .chunk dork.temp = .length dork.temp
scoreboard players operation .chunk dork.temp %= .chunk_length dork.temp
# no need for loops, only need to check if it's 1 or 2
execute if score .chunk dork.temp matches 1 run function dork.base64:impl/encode/add_padding/1
execute if score .chunk dork.temp matches 2 run function dork.base64:impl/encode/add_padding/2

scoreboard players set .chunk dork.temp 0
data modify storage dork.base64:temp args.encode.converting set from storage dork.base64:io encode.input
execute if score .length dork.temp matches 1 run data modify storage dork.base64:temp args.encode.chars set string storage dork.base64:temp args.encode.converting 0 1
execute if score .length dork.temp matches 2 run data modify storage dork.base64:temp args.encode.chars set string storage dork.base64:temp args.encode.converting 0 2
execute if score .length dork.temp matches 3.. run data modify storage dork.base64:temp args.encode.chars set string storage dork.base64:temp args.encode.converting 0 3

execute if score .index dork.temp < .length dork.temp run function dork.base64:impl/encode/loop with storage dork.base64:temp args.encode

# append padding
execute if score .success dork.temp matches 1 run function dork.base64:impl/encode/add_padding/append with storage dork.base64:temp args.encode
execute if score .success dork.temp matches 0 run data remove storage dork.base64:io encode.output

execute if score .success dork.temp matches 1 run data modify storage dork.base64:io encode.output set from storage dork.base64:temp args.encode.output
