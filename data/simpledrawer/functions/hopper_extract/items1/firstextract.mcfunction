data modify storage simpledrawer:temp ItemCreated set from entity @e[type=glow_item_frame,tag=SD_selected,limit=1] Item.tag.data
data modify storage simpledrawer:temp ItemCreated.Slot set value 1b

execute store result storage simpledrawer:temp ItemCreated.Count byte 1 run scoreboard players get nbhopper SD_tempC
data modify block ~ ~ ~ Items append from storage simpledrawer:temp ItemCreated

data remove storage simpledrawer:temp ItemCreated
