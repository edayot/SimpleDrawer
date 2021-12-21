#copy and add all like firstfill.mcfunction
tag @e[type=glow_item_frame,tag=SD_summoned] add filled
data modify storage simpledrawertemp ItemPlace set from block ~ ~ ~ Items[0].tag.data
data modify storage simpledrawertemp ItemPlace.Count set value 1b
data modify entity @e[type=glow_item_frame,tag=SD_summoned,limit=1] Item set from storage simpledrawertemp ItemPlace
data modify entity @e[type=glow_item_frame,tag=SD_summoned,limit=1] Item.tag.data set from block ~ ~ ~ Items[0].tag.data
data modify entity @e[type=glow_item_frame,tag=SD_summoned,limit=1] Item.tag.info set from block ~ ~ ~ Items[0].tag.info



