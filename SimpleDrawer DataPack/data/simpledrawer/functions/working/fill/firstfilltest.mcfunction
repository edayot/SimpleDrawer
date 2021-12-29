
data remove storage simpledrawer:temp info
data modify storage simpledrawer:temp info set from entity @s Item.tag.info
#test SelectedItem
data remove storage simpledrawer:temp ItemAdded
execute at @s run data modify storage simpledrawer:temp ItemAdded set from entity @p[tag=SD_adder] SelectedItem
execute if data storage simpledrawer:temp ItemAdded run tag @s add SD_filled
 

execute as @s[tag=SD_filled] run function simpledrawer:working/fill/firstfill

