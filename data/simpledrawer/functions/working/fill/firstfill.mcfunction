


data modify storage simpledrawer:temp info set from entity @s Item.tag.info
#test SelectedItem
data remove storage simpledrawer:temp ItemAdded
execute at @s run data modify storage simpledrawer:temp ItemAdded set from entity @p[tag=SD_adder] SelectedItem
execute if data storage simpledrawer:temp ItemAdded run tag @s add filled
 

#item copy and display
execute as @s[tag=filled] run data modify entity @s Item set from storage simpledrawer:temp ItemAdded
execute as @s[tag=filled] run data modify entity @s Item.tag.data set from storage simpledrawer:temp ItemAdded
data modify entity @s Item.tag.info set from storage simpledrawer:temp info
execute as @s[tag=filled] run function simpledrawer:working/display

#clear and reset
execute as @s[tag=filled] run item replace entity @p[tag=SD_adder] weapon.mainhand with air



