data modify storage drawer:temp ItemCreated set from entity @e[type=glow_item_frame,tag=SD_selected,limit=1] Item.tag.data
data modify storage drawer:temp ItemCreated.Slot set value 4b

execute store result storage drawer:temp ItemCreated.Count byte 1 run scoreboard players get nbhopper SD_tempC
data modify block ~ ~ ~ Items append from storage drawer:temp ItemCreated

data remove storage drawer:temp ItemCreated
