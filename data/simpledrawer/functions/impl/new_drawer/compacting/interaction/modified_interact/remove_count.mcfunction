
execute if score #compacting_type simpledrawer.io matches 1 run scoreboard players operation #count_insert simpledrawer.io /= #compacting_nugget_in_ingot simpledrawer.io
execute if score #compacting_type simpledrawer.io matches 2 run scoreboard players operation #count_insert simpledrawer.io /= #compacting_nugget_in_block simpledrawer.io


item modify entity @p[tag=simpledrawer.interacter] weapon.mainhand simpledrawer:remove_count_output

