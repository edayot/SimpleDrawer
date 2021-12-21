#copy and add all like firstfill.mcfunction
tag @e[type=glow_item_frame,tag=SD_summoned] add filled
data modify storage simpledrawer:temp ItemPlace set from block ~ ~ ~ Items[0].tag.data
data modify storage simpledrawer:temp ItemPlace.Count set value 1b
data modify entity @e[type=glow_item_frame,tag=SD_summoned,limit=1] Item set from storage simpledrawer:temp ItemPlace
data modify entity @e[type=glow_item_frame,tag=SD_summoned,limit=1] Item.tag.data set from block ~ ~ ~ Items[0].tag.data
data modify entity @e[type=glow_item_frame,tag=SD_summoned,limit=1] Item.tag.info set from block ~ ~ ~ Items[0].tag.info



