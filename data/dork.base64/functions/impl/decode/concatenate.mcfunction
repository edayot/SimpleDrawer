$data modify storage dork.base64:temp args.decode.output set value "$(output)$(character)"

execute unless score .check_for_terminator dork.temp matches 1 run return 0
data modify storage dork.base64:temp end set value ""
$data modify storage dork.base64:temp end set string storage dork.base64:temp args.decode.output -$(terminator_length)
execute store success score .different dork.temp store success score .continue dork.temp run data modify storage dork.base64:temp end set from storage dork.base64:io decode.terminator
execute if score .different dork.temp matches 0 run scoreboard players set .index dork.temp -1
$execute if score .different dork.temp matches 0 if score .include_terminator dork.temp matches 0 run data modify storage dork.base64:temp args.decode.output set string storage dork.base64:temp args.decode.output 0 -$(terminator_length)
