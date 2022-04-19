#DrawerItem.Count = DrawerItem.Count + SelectedItem.Count
execute store result score maxCount simpledrawer.tempC run data get entity @s Item.tag.info.maxCount
execute store result score nbcrate simpledrawer.tempC run data get entity @s Item.tag.data.Count
execute store result score nbplayer simpledrawer.tempC run data get entity @p[tag=simpledrawer.adder] SelectedItem.Count
scoreboard players operation nbcrate simpledrawer.tempC += nbplayer simpledrawer.tempC 
execute if score nbcrate simpledrawer.tempC <= maxCount simpledrawer.tempC store result entity @s Item.tag.data.Count long 1 run scoreboard players get nbcrate simpledrawer.tempC 
execute if score nbcrate simpledrawer.tempC <= maxCount simpledrawer.tempC run item replace entity @p[tag=simpledrawer.adder] weapon.mainhand with air
#Display and reset


execute unless score nbcrate simpledrawer.tempC <= maxCount simpledrawer.tempC run function simpledrawer:working/fill/fullfill


function simpledrawer:working/display/item_frame_name