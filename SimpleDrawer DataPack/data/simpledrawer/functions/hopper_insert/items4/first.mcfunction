#add item to drawer
data remove storage simpledrawer:temp ItemHopper
data modify storage simpledrawer:temp ItemHopper set from block ~ ~2 ~ Items[{Slot:4b}]
data modify storage simpledrawer:temp info set from entity @e[type=glow_item_frame,tag=SD_selected,limit=1] Item.tag.info

tag @e[type=glow_item_frame,tag=SD_selected,limit=1] add filled

data modify entity @e[type=glow_item_frame,tag=SD_selected,limit=1] Item set from storage simpledrawer:temp ItemHopper
data modify entity @e[type=glow_item_frame,tag=SD_selected,limit=1] Item.tag.data set from storage simpledrawer:temp ItemHopper
data modify entity @e[type=glow_item_frame,tag=SD_selected,limit=1] Item.tag.data.Count set value 1
data modify entity @e[type=glow_item_frame,tag=SD_selected,limit=1] Item.tag.info set from storage simpledrawer:temp info

execute as @e[type=glow_item_frame,tag=SD_selected,limit=1] run function simpledrawer:working/display

#delete item from hopper
scoreboard players set nbhopper SD_tempC 0
execute store result score nbhopper SD_tempC run data get block ~ ~2 ~ Items[{Slot:4b}].Count
scoreboard players remove nbhopper SD_tempC 1
execute store result block ~ ~2 ~ Items[{Slot:4b}].Count byte 1 run scoreboard players get nbhopper SD_tempC

scoreboard players set @s SD_tempC 0