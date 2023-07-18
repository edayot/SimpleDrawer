

data remove storage simpledrawer:io input
data modify storage simpledrawer:io input set from storage simpledrawer:main temp.Inventory[{Slot:31b}]

scoreboard players set #success simpledrawer.io 0
execute if data storage simpledrawer:io input run function simpledrawer:impl/new_drawer/working/io/input

execute if score #success simpledrawer.io matches 1 run item modify entity @p[tag=simpledrawer.interacter] container.31 simpledrawer:impl/remove_count_output

