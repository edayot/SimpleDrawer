#Take simpledrawer:io input as argument
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
execute store success score #if_filled simpledrawer.math if entity @s[tag=simpledrawer.drawer.filled]



#Disable input to avoid to many nbt in one item
scoreboard players set #good_item simpledrawer.math 1
function #simpledrawer:disabled_input


execute if score #good_item simpledrawer.math matches 1 if score #if_input simpledrawer.math matches 1 if score #if_filled simpledrawer.math matches 0 run function simpledrawer:drawer/working/fill/first
execute if score #good_item simpledrawer.math matches 1 if score #if_input simpledrawer.math matches 1 if score #if_filled simpledrawer.math matches 1 run function simpledrawer:drawer/working/fill/test