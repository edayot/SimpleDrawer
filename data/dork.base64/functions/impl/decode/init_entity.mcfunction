kill @s
function dork.base64:impl/decode/loop with storage dork.base64:temp args.decode

data modify entity @s text set value '{"storage":"dork.base64:temp","nbt":"args.decode.output"}'
data modify storage dork.base64:temp args.decode.escaped_output set string entity @s text 1 -1
