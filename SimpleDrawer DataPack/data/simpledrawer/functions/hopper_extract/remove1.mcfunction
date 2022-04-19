execute store result score nb simpledrawer.tempC run data get entity @s Item.tag.data.Count
scoreboard players remove nb simpledrawer.tempC 1
execute if score nb simpledrawer.tempC matches ..0 run function simpledrawer:working/unfill/inf64
execute if score nb simpledrawer.tempC matches 1.. store result entity @s Item.tag.data.Count long 1 run scoreboard players get nb simpledrawer.tempC
execute if score nb simpledrawer.tempC matches 1.. run function simpledrawer:working/display/item_frame_name

