tag @s add simpledrawer.adder
execute as @e[tag=simpledrawer.selected,tag=!simpledrawer.drawer.filled] run function simpledrawer:drawer/working/repart/downgrade_2
execute if entity @e[tag=simpledrawer.selected,tag=simpledrawer.drawer.filled] run tellraw @s [{"translate":"simpledrawer.tellraw_prefix","color":"red"},{"translate":"simpledrawer.text.cant_downgrade"}]
tag @s remove simpledrawer.adder

