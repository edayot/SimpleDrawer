
data modify storage simpledrawer:io input set from storage simpledrawer:main temp.ItemInput
execute as @e[tag=simpledrawer.selected,limit=1] run function simpledrawer:drawer/working/repart/simple_fill_2
execute if score #success simpledrawer.io matches 1 run item modify entity @s weapon.mainhand simpledrawer:set_count_output