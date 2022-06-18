tag @s add simpledrawer.adder
execute as @e[tag=simpledrawer.selected] run function simpledrawer:drawer/working/repart/upgrade_2
execute if score #upgrade_success simpledrawer.math matches 1 run item modify entity @s weapon.mainhand simpledrawer:remove_1

tag @s remove simpledrawer.adder
