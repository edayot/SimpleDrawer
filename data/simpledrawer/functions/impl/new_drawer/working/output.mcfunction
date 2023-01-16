#Take #count simpledrawer.io as argument
#Take #input_slot simpledrawer.io as argument
#Executed by simpledrawer.drawer.item
#Generate simpledrawer:io output
#also #success simpledrawer.io

scoreboard players set #success simpledrawer.io 0
data remove storage simpledrawer:io output
scoreboard players set #count_output simpledrawer.io 0

execute if score #input_slot simpledrawer.io matches 0 if score #count simpledrawer.io matches 0.. if score #count simpledrawer.io >= @s simpledrawer.drawer.Count0 run function simpledrawer:impl/new_drawer/working/0/unfill/sup
execute if score #input_slot simpledrawer.io matches 0 if score #count simpledrawer.io matches 0.. if score #count simpledrawer.io < @s simpledrawer.drawer.Count0 run function simpledrawer:impl/new_drawer/working/0/unfill/normal

execute if score @s simpledrawer.drawer.nb_enabled matches 2.. if score #input_slot simpledrawer.io matches 1 if score #count simpledrawer.io matches 0.. if score #count simpledrawer.io >= @s simpledrawer.drawer.Count1 run function simpledrawer:impl/new_drawer/working/1/unfill/sup
execute if score @s simpledrawer.drawer.nb_enabled matches 2.. if score #input_slot simpledrawer.io matches 1 if score #count simpledrawer.io matches 0.. if score #count simpledrawer.io < @s simpledrawer.drawer.Count1 run function simpledrawer:impl/new_drawer/working/1/unfill/normal

execute if score @s simpledrawer.drawer.nb_enabled matches 3.. if score #input_slot simpledrawer.io matches 2 if score #count simpledrawer.io matches 0.. if score #count simpledrawer.io >= @s simpledrawer.drawer.Count2 run function simpledrawer:impl/new_drawer/working/2/unfill/sup
execute if score @s simpledrawer.drawer.nb_enabled matches 3.. if score #input_slot simpledrawer.io matches 2 if score #count simpledrawer.io matches 0.. if score #count simpledrawer.io < @s simpledrawer.drawer.Count2 run function simpledrawer:impl/new_drawer/working/2/unfill/normal

execute if score @s simpledrawer.drawer.nb_enabled matches 4.. if score #input_slot simpledrawer.io matches 3 if score #count simpledrawer.io matches 0.. if score #count simpledrawer.io >= @s simpledrawer.drawer.Count3 run function simpledrawer:impl/new_drawer/working/3/unfill/sup
execute if score @s simpledrawer.drawer.nb_enabled matches 4.. if score #input_slot simpledrawer.io matches 3 if score #count simpledrawer.io matches 0.. if score #count simpledrawer.io < @s simpledrawer.drawer.Count3 run function simpledrawer:impl/new_drawer/working/3/unfill/normal

execute if score @s simpledrawer.drawer.nb_enabled matches 5.. if score #input_slot simpledrawer.io matches 4 if score #count simpledrawer.io matches 0.. if score #count simpledrawer.io >= @s simpledrawer.drawer.Count4 run function simpledrawer:impl/new_drawer/working/4/unfill/sup
execute if score @s simpledrawer.drawer.nb_enabled matches 5.. if score #input_slot simpledrawer.io matches 4 if score #count simpledrawer.io matches 0.. if score #count simpledrawer.io < @s simpledrawer.drawer.Count4 run function simpledrawer:impl/new_drawer/working/4/unfill/normal

execute if score @s simpledrawer.drawer.nb_enabled matches 6.. if score #input_slot simpledrawer.io matches 5 if score #count simpledrawer.io matches 0.. if score #count simpledrawer.io >= @s simpledrawer.drawer.Count5 run function simpledrawer:impl/new_drawer/working/5/unfill/sup
execute if score @s simpledrawer.drawer.nb_enabled matches 6.. if score #input_slot simpledrawer.io matches 5 if score #count simpledrawer.io matches 0.. if score #count simpledrawer.io < @s simpledrawer.drawer.Count5 run function simpledrawer:impl/new_drawer/working/5/unfill/normal

