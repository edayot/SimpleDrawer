#item copy and display
data modify entity @s Item set from storage simpledrawer:temp ItemAdded
data modify entity @s Item.tag.data set from storage simpledrawer:temp ItemAdded
data modify entity @s Item.tag.info set from storage simpledrawer:temp info
function simpledrawer:working/display

#clear and reset

item modify entity @p[tag=SD_adder] weapon.mainhand simpledrawer:selected_item

execute store success entity @s Item.tag.info.stack1 byte 1 run clear @p[tag=SD_adder] #simpledrawer:stack1{SelectedItem:1b} 0
execute store success entity @s Item.tag.info.stack16 byte 1 run clear @p[tag=SD_adder] #simpledrawer:stack16{SelectedItem:1b} 0

item replace entity @p[tag=SD_adder] weapon.mainhand with air

