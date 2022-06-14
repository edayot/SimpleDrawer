scoreboard players operation #count_drawer simpledrawer.math -= #count simpledrawer.io
execute store result entity @s Item.tag.simpledrawer.Item.Count long 1 run scoreboard players get #count_drawer simpledrawer.math
function simpledrawer:drawer/working/display/count

#IO compatibility
data modify storage simpledrawer:io success set value 1
data modify storage simpledrawer:io output set from storage simpledrawer:io input
execute store result storage simpledrawer:io output.Count long 1 run scoreboard players get #count simpledrawer.io