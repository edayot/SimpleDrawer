scoreboard players set nbhopper simpledrawer.tempC 0
execute store result score nbhopper simpledrawer.tempC run data get block ~ ~2 ~ Items[{Slot:3b}].Count
scoreboard players remove nbhopper simpledrawer.tempC 1

execute store result score maxCount simpledrawer.tempC run data get entity @e[type=glow_item_frame,tag=simpledrawer.selected,limit=1] Item.tag.info.maxCount
execute store result score Count simpledrawer.tempC run data get entity @e[type=glow_item_frame,tag=simpledrawer.selected,limit=1] Item.tag.data.Count
scoreboard players add Count simpledrawer.tempC 1


execute if score Count simpledrawer.tempC <= maxCount simpledrawer.tempC store result entity @e[type=glow_item_frame,tag=simpledrawer.selected,limit=1] Item.tag.data.Count long 1 run scoreboard players get Count simpledrawer.tempC
execute if score Count simpledrawer.tempC <= maxCount simpledrawer.tempC store result block ~ ~2 ~ Items[{Slot:3b}].Count byte 1 run scoreboard players get nbhopper simpledrawer.tempC
execute if score Count simpledrawer.tempC <= maxCount simpledrawer.tempC as @e[type=glow_item_frame,tag=simpledrawer.selected,limit=1] run function simpledrawer:working/display/item_frame_name
execute if score Count simpledrawer.tempC <= maxCount simpledrawer.tempC run scoreboard players set @s simpledrawer.tempC 0
