scoreboard players set #already simpledrawer.math 1

tag @s add simpledrawer.adder
execute as @e[tag=simpledrawer.selected,limit=1,tag=simpledrawer.drawer.filled] run function simpledrawer:drawer/working/repart/simple_unfill_2
tag @s remove simpledrawer.adder