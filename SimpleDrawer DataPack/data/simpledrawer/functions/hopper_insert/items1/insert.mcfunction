scoreboard players set nbhopper SD_tempC 0
execute store result score nbhopper SD_tempC run data get block ~ ~2 ~ Items[{Slot:1b}].Count
scoreboard players remove nbhopper SD_tempC 1

execute store result score maxCount SD_tempC run data get entity @e[type=glow_item_frame,tag=SD_selected,limit=1] Item.tag.info.maxCount
execute store result score Count SD_tempC run data get entity @e[type=glow_item_frame,tag=SD_selected,limit=1] Item.tag.data.Count
scoreboard players add Count SD_tempC 1


execute if score Count SD_tempC <= maxCount SD_tempC store result entity @e[type=glow_item_frame,tag=SD_selected,limit=1] Item.tag.data.Count long 1 run scoreboard players get Count SD_tempC
execute if score Count SD_tempC <= maxCount SD_tempC store result block ~ ~2 ~ Items[{Slot:1b}].Count byte 1 run scoreboard players get nbhopper SD_tempC
execute if score Count SD_tempC <= maxCount SD_tempC as @e[type=glow_item_frame,tag=SD_selected,limit=1] run function simpledrawer:working/display
execute if score Count SD_tempC <= maxCount SD_tempC run scoreboard players set @s SD_tempC 0
