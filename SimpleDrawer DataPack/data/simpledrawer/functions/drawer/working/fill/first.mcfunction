tag @s add simpledrawer.drawer.filled
#Copy item, nbt
data modify entity @s Item set from storage simpledrawer:main temp.input_no_slot
data modify entity @s Item.tag.simpledrawer set from storage simpledrawer:main temp.ItemDrawer.tag.simpledrawer
data modify entity @s Item.tag.simpledrawer.Item set from storage simpledrawer:main temp.input_no_slot
function simpledrawer:drawer/working/display/count

#IO compatibility
data modify storage simpledrawer:io output set from storage simpledrawer:io input
data modify storage simpledrawer:io output.Count set value 0b

scoreboard players set #success simpledrawer.io 1
scoreboard players set #count_output simpledrawer.io 0