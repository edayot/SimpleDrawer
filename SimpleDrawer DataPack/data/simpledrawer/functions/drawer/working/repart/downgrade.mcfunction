
execute as @e[tag=simpledrawer.selected,tag=!simpledrawer.drawer.filled] run function simpledrawer:drawer/working/repart/downgrade_2
execute if entity @e[tag=simpledrawer.selected,tag=simpledrawer.drawer.filled] run title @s[tag=!global.ignore.gui] actionbar [{"translate":"simpledrawer.tellraw_prefix","color":"dark_red"},{"translate":"simpledrawer.text.cant_downgrade","color":"red"}]


