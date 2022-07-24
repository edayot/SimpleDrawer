function simpledrawer:drawer/working/input
execute if score #good_item simpledrawer.math matches 0 run title @p[tag=!global.ignore.gui,tag=simpledrawer.adder] actionbar [{"translate":"simpledrawer.tellraw_prefix","color":"dark_red"},{"translate":"simpledrawer.input_error","color":"red"}]

execute if score #success simpledrawer.io matches 1 run scoreboard players set #already simpledrawer.math 1
execute if score #success simpledrawer.io matches 1 run item modify entity @p[tag=simpledrawer.adder] weapon.mainhand simpledrawer:set_count_output
execute if score #success simpledrawer.io matches 1 if score @s simpledrawer.drawer.Count = @s simpledrawer.drawer.maxCount run function simpledrawer:drawer/working/repart/simple_fill_3
