


data modify storage simpledrawertemp info set from entity @s Item.tag.info
#test SelectedItem
data remove storage simpledrawertemp ItemAdded
execute at @s run data modify storage simpledrawertemp ItemAdded set from entity @p[tag=SD_adder] SelectedItem
execute if data storage simpledrawertemp ItemAdded run tag @s add filled
 

#item copy and display
execute as @s[tag=filled] run data modify entity @s Item set from storage simpledrawertemp ItemAdded
execute as @s[tag=filled] run data modify entity @s Item.tag.data set from storage simpledrawertemp ItemAdded
data modify entity @s Item.tag.info set from storage simpledrawertemp info
execute as @s[tag=filled] run function simpledrawerworking/display

#clear and reset
execute as @s[tag=filled] run item replace entity @p[tag=SD_adder] weapon.mainhand with air



