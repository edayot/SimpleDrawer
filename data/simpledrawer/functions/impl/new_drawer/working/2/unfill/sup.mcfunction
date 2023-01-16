
data modify storage simpledrawer:io output set from entity @s Item.tag.simpledrawer.Item2


data remove entity @s Item.tag.simpledrawer.Item2



#IO compatibility

scoreboard players set #success simpledrawer.io 1
execute store result storage simpledrawer:io output.Count int 1 run scoreboard players get @s simpledrawer.drawer.Count2
scoreboard players operation #count_output simpledrawer.io = @s simpledrawer.drawer.Count2
scoreboard players set @s simpledrawer.drawer.Count2 0

