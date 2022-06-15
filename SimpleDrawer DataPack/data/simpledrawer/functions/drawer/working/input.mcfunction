#Take simpledrawer:io input as argument
#Generate simpledrawer:io output and #count_output simpledrawer:io
#also simpledrawer:io success
#Executed by simpledrawer.drawer.item
#define storage simpledrawer:io
data modify storage simpledrawer:io success set value 0
data remove storage simpledrawer:io output

data modify storage simpledrawer:main temp.ItemDrawer set from entity @s Item

data modify storage simpledrawer:main temp.input_no_slot set from storage simpledrawer:io input
data remove storage simpledrawer:main temp.input_no_slot.Slot


execute if data storage simpledrawer:io input if entity @s[tag=!simpledrawer.drawer.filled] run function simpledrawer:drawer/working/fill/first
execute if data storage simpledrawer:io input if entity @s[tag=simpledrawer.drawer.filled] run function simpledrawer:drawer/working/fill/test