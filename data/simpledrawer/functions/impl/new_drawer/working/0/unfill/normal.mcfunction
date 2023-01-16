
data modify storage simpledrawer:io output set from entity @s Item.tag.simpledrawer.Item0


scoreboard players operation @s simpledrawer.drawer.Count0 -= #count simpledrawer.io


#IO compatibility

scoreboard players set #success simpledrawer.io 1
execute store result storage simpledrawer:io output.Count int 1 run scoreboard players get #count simpledrawer.io
scoreboard players operation #count_output simpledrawer.io = #count simpledrawer.io
