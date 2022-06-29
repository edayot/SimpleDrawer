
data remove storage simpledrawer:io input
data modify storage simpledrawer:io input set from storage simpledrawer:main temp.ItemPlayer[{Slot:21b}]
function simpledrawer:drawer/working/input
execute if score #success simpledrawer.io matches 1 run item modify entity @p[tag=simpledrawer.adder] container.21 simpledrawer:set_count_output
execute if score #success simpledrawer.io matches 1 run scoreboard players set #already simpledrawer.math 1
execute if score #success simpledrawer.io matches 1 if score @s simpledrawer.drawer.Count = @s simpledrawer.drawer.maxCount run function simpledrawer:drawer/working/repart/big_fill_3

