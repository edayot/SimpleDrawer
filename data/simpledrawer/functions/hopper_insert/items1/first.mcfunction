#add item to drawer
data remove storage simpledrawertemp ItemHopper
data modify storage simpledrawertemp ItemHopper set from block ~ ~2 ~ Items[{Slot:1b}]
data modify storage simpledrawertemp info set from entity @e[type=glow_item_frame,tag=SD_selected,limit=1] Item.tag.info

tag @e[type=glow_item_frame,tag=SD_selected,limit=1] add filled

data modify entity @e[type=glow_item_frame,tag=SD_selected,limit=1] Item set from storage simpledrawertemp ItemHopper
data modify entity @e[type=glow_item_frame,tag=SD_selected,limit=1] Item.tag.data set from storage simpledrawertemp ItemHopper
data modify entity @e[type=glow_item_frame,tag=SD_selected,limit=1] Item.tag.data.Count set value 1
data modify entity @e[type=glow_item_frame,tag=SD_selected,limit=1] Item.tag.info set from storage simpledrawertemp info

execute as @e[type=glow_item_frame,tag=SD_selected,limit=1] run function simpledrawerworking/display

#delete item from hopper
scoreboard players set nbhopper SD_tempC 0
execute store result score nbhopper SD_tempC run data get block ~ ~2 ~ Items[{Slot:1b}].Count
scoreboard players remove nbhopper SD_tempC 1
execute store result block ~ ~2 ~ Items[{Slot:1b}].Count byte 1 run scoreboard players get nbhopper SD_tempC

scoreboard players set @s SD_tempC 0