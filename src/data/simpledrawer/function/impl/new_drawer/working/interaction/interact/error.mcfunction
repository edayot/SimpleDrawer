



execute if score #good_item simpledrawer.math matches 0 run title @p[tag=!global.ignore.gui,tag=simpledrawer.interacter] actionbar [{"translate":"simpledrawer.tellraw_prefix","color":"dark_red"},{"translate":"simpledrawer.input_error","color":"red"}]





execute if score #success simpledrawer.io matches -2 run title @p[tag=!global.ignore.gui,tag=simpledrawer.interacter] actionbar [{"translate":"simpledrawer.tellraw_prefix","color":"dark_red"},{"translate":"simpledrawer.full_error","color":"red"}]



