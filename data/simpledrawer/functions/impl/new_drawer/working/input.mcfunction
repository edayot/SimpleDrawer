#Take simpledrawer:io input as argument
#Take #input_slot simpledrawer.io as argument
#Generate simpledrawer:io output and #count_output simpledrawer:io
#also #success simpledrawer.io
#Executed by simpledrawer.drawer.item
#define storage simpledrawer:io

scoreboard players set #success simpledrawer.io 0
scoreboard players set #nothing_changed simpledrawer.io 0
data remove storage simpledrawer:io output

data modify storage simpledrawer:main temp.ItemDrawer set from entity @s Item

data modify storage simpledrawer:main temp.input_no_slot set from storage simpledrawer:io input
data remove storage simpledrawer:main temp.input_no_slot.Slot

execute store success score #if_input simpledrawer.math if data storage simpledrawer:io input
scoreboard players operation #nb0 simpledrawer.math = @s simpledrawer.drawer.Count0
scoreboard players operation #nb1 simpledrawer.math = @s simpledrawer.drawer.Count1
scoreboard players operation #nb2 simpledrawer.math = @s simpledrawer.drawer.Count2
scoreboard players operation #nb3 simpledrawer.math = @s simpledrawer.drawer.Count3
scoreboard players operation #nb4 simpledrawer.math = @s simpledrawer.drawer.Count4
scoreboard players operation #nb5 simpledrawer.math = @s simpledrawer.drawer.Count5


#Disable input to avoid to many nbt in one item
scoreboard players set #good_item simpledrawer.math 1
function #simpledrawer:disabled_input


execute if score #good_item simpledrawer.math matches 1 if score #if_input simpledrawer.math matches 1 if score #input_slot simpledrawer.io matches 0 if score #nb0 simpledrawer.math matches 0 run function simpledrawer:impl/new_drawer/working/0/fill/first
execute if score #good_item simpledrawer.math matches 1 if score #if_input simpledrawer.math matches 1 if score #input_slot simpledrawer.io matches 0 unless score #nb0 simpledrawer.math matches 0 run function simpledrawer:impl/new_drawer/working/0/fill/test

execute if score @s simpledrawer.drawer.nb_enabled matches 2.. if score #good_item simpledrawer.math matches 1 if score #if_input simpledrawer.math matches 1 if score #input_slot simpledrawer.io matches 1 if score #nb1 simpledrawer.math matches 0 run function simpledrawer:impl/new_drawer/working/1/fill/first
execute if score @s simpledrawer.drawer.nb_enabled matches 2.. if score #good_item simpledrawer.math matches 1 if score #if_input simpledrawer.math matches 1 if score #input_slot simpledrawer.io matches 1 unless score #nb1 simpledrawer.math matches 0 run function simpledrawer:impl/new_drawer/working/1/fill/test

execute if score @s simpledrawer.drawer.nb_enabled matches 3.. if score #good_item simpledrawer.math matches 1 if score #if_input simpledrawer.math matches 1 if score #input_slot simpledrawer.io matches 2 if score #nb2 simpledrawer.math matches 0 run function simpledrawer:impl/new_drawer/working/2/fill/first
execute if score @s simpledrawer.drawer.nb_enabled matches 3.. if score #good_item simpledrawer.math matches 1 if score #if_input simpledrawer.math matches 1 if score #input_slot simpledrawer.io matches 2 unless score #nb2 simpledrawer.math matches 0 run function simpledrawer:impl/new_drawer/working/2/fill/test

execute if score @s simpledrawer.drawer.nb_enabled matches 4.. if score #good_item simpledrawer.math matches 1 if score #if_input simpledrawer.math matches 1 if score #input_slot simpledrawer.io matches 3 if score #nb3 simpledrawer.math matches 0 run function simpledrawer:impl/new_drawer/working/3/fill/first
execute if score @s simpledrawer.drawer.nb_enabled matches 4.. if score #good_item simpledrawer.math matches 1 if score #if_input simpledrawer.math matches 1 if score #input_slot simpledrawer.io matches 3 unless score #nb3 simpledrawer.math matches 0 run function simpledrawer:impl/new_drawer/working/3/fill/test

execute if score @s simpledrawer.drawer.nb_enabled matches 5.. if score #good_item simpledrawer.math matches 1 if score #if_input simpledrawer.math matches 1 if score #input_slot simpledrawer.io matches 4 if score #nb4 simpledrawer.math matches 0 run function simpledrawer:impl/new_drawer/working/4/fill/first
execute if score @s simpledrawer.drawer.nb_enabled matches 5.. if score #good_item simpledrawer.math matches 1 if score #if_input simpledrawer.math matches 1 if score #input_slot simpledrawer.io matches 4 unless score #nb4 simpledrawer.math matches 0 run function simpledrawer:impl/new_drawer/working/4/fill/test

execute if score @s simpledrawer.drawer.nb_enabled matches 6.. if score #good_item simpledrawer.math matches 1 if score #if_input simpledrawer.math matches 1 if score #input_slot simpledrawer.io matches 5 if score #nb5 simpledrawer.math matches 0 run function simpledrawer:impl/new_drawer/working/5/fill/first
execute if score @s simpledrawer.drawer.nb_enabled matches 6.. if score #good_item simpledrawer.math matches 1 if score #if_input simpledrawer.math matches 1 if score #input_slot simpledrawer.io matches 5 unless score #nb5 simpledrawer.math matches 0 run function simpledrawer:impl/new_drawer/working/5/fill/test




