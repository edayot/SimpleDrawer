#add item to drawer
data remove storage simpledrawer:temp ItemHopper
data modify storage simpledrawer:temp ItemHopper set from block ~ ~2 ~ Items[{Slot:2b}]
data remove storage simpledrawer:temp info
data modify storage simpledrawer:temp info set from entity @e[type=glow_item_frame,tag=simpledrawer.selected,limit=1] Item.tag.info

tag @e[type=glow_item_frame,tag=simpledrawer.selected,limit=1] add simpledrawer.filled

data modify entity @e[type=glow_item_frame,tag=simpledrawer.selected,limit=1] Item set from storage simpledrawer:temp ItemHopper
data modify entity @e[type=glow_item_frame,tag=simpledrawer.selected,limit=1] Item.tag.data set from storage simpledrawer:temp ItemHopper
data modify entity @e[type=glow_item_frame,tag=simpledrawer.selected,limit=1] Item.tag.data.Count set value 1
data modify entity @e[type=glow_item_frame,tag=simpledrawer.selected,limit=1] Item.tag.info set from storage simpledrawer:temp info

execute as @e[type=glow_item_frame,tag=simpledrawer.selected,limit=1] run function simpledrawer:working/display

#delete item from hopper
scoreboard players set nbhopper simpledrawer.tempC 0
execute store result score nbhopper simpledrawer.tempC run data get block ~ ~2 ~ Items[{Slot:2b}].Count
scoreboard players remove nbhopper simpledrawer.tempC 1
execute store result block ~ ~2 ~ Items[{Slot:2b}].Count byte 1 run scoreboard players get nbhopper simpledrawer.tempC

scoreboard players set @s simpledrawer.tempC 0