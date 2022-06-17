
execute store success score #player simpledrawer.math if entity @p[distance=..5]
execute if score #player simpledrawer.math matches 1 run function simpledrawer:drawer/working/display/count_2
execute if score #player simpledrawer.math matches 0 run tag @s add simpledrawer.drawer.to_update
