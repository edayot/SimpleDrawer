#add item to drawer
data remove storage drawer:temp ItemHopper
data modify storage drawer:temp ItemHopper set from block ~ ~2 ~ Items[{Slot:0b}]
data modify storage drawer:temp info set from entity @e[type=glow_item_frame,tag=SD_selected,limit=1] Item.tag.info

tag @e[type=glow_item_frame,tag=SD_selected,limit=1] add filled

data modify entity @e[type=glow_item_frame,tag=SD_selected,limit=1] Item set from storage drawer:temp ItemHopper
data modify entity @e[type=glow_item_frame,tag=SD_selected,limit=1] Item.tag.data set from storage drawer:temp ItemHopper
data modify entity @e[type=glow_item_frame,tag=SD_selected,limit=1] Item.tag.data.Count set value 1
data modify entity @e[type=glow_item_frame,tag=SD_selected,limit=1] Item.tag.info set from storage drawer:temp info

execute as @e[type=glow_item_frame,tag=SD_selected,limit=1] run function drawer:working/display

#delete item from hopper
scoreboard players set nbhopper SD_tempC 0
execute store result score nbhopper SD_tempC run data get block ~ ~2 ~ Items[{Slot:0b}].Count
scoreboard players remove nbhopper SD_tempC 1
execute store result block ~ ~2 ~ Items[{Slot:0b}].Count byte 1 run scoreboard players get nbhopper SD_tempC

scoreboard players set @s SD_tempC 0