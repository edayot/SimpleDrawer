execute store result score #count_input simpledrawer.math run data get storage simpledrawer:io input.Count
execute store result score #count_drawer simpledrawer.math run data get storage simpledrawer:main temp.ItemDrawer.tag.simpledrawer.Item.Count

scoreboard players operation #count_total simpledrawer.math = #count_input simpledrawer.math
scoreboard players operation #count_total simpledrawer.math += #count_drawer simpledrawer.math


execute if score #count_total simpledrawer.math < @s simpledrawer.drawer.maxCount store result entity @s Item.tag.simpledrawer.Item.Count int 1 run scoreboard players get #count_total simpledrawer.math
execute if score #count_total simpledrawer.math >= @s simpledrawer.drawer.maxCount store result entity @s Item.tag.simpledrawer.Item.Count int 1 run scoreboard players get @s simpledrawer.drawer.maxCount
function simpledrawer:drawer/working/display/count

#IO compatibility
data modify storage simpledrawer:io output set from storage simpledrawer:io input

scoreboard players operation #count_output simpledrawer.math = #count_total simpledrawer.math
scoreboard players operation #count_output simpledrawer.math -= @s simpledrawer.drawer.maxCount

execute if score #count_output simpledrawer.math matches 0.. store result storage simpledrawer:io output.Count int 1 run scoreboard players get #count_output simpledrawer.math
execute if score #count_output simpledrawer.math matches 0.. run scoreboard players operation #count_output simpledrawer.io = #count_output simpledrawer.math
execute unless score #count_output simpledrawer.math matches 0.. run data modify storage simpledrawer:io output.Count set value 0
execute unless score #count_output simpledrawer.math matches 0.. run scoreboard players set #count_output simpledrawer.io 0
scoreboard players set #success simpledrawer.io 1

