data modify storage simpledrawer:io output set from entity @s Item.tag.simpledrawer.Item


scoreboard players operation #count_drawer simpledrawer.math -= #count simpledrawer.io
execute store result entity @s Item.tag.simpledrawer.Item.Count int 1 run scoreboard players get #count_drawer simpledrawer.math
function simpledrawer:drawer/working/display/count

#IO compatibility

scoreboard players set #success simpledrawer.io 1
execute store result storage simpledrawer:io output.Count int 1 run scoreboard players get #count simpledrawer.io