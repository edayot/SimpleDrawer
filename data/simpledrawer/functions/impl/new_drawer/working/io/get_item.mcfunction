#Generate simpledrawer:io output of the item in the drawer

data modify storage simpledrawer:io output set value {id:"minecraft:air",Count:0b}

execute if entity @s[tag=simpledrawer.drawer.filled] run data modify storage simpledrawer:io output set from entity @s item.tag.simpledrawer.Item
execute if entity @s[tag=simpledrawer.drawer.filled] store result storage simpledrawer:io output.Count int 1 run scoreboard players get @s simpledrawer.drawer.Count

scoreboard players operation #max_count simpledrawer.io = @s simpledrawer.drawer.maxCount