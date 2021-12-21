#DrawerItem.Count = DrawerItem.Count + SelectedItem.Count
execute store result score maxCount SD_tempC run data get entity @s Item.tag.info.maxCount
execute store result score nbcrate SD_tempC run data get entity @s Item.tag.data.Count
execute store result score nbplayer SD_tempC run data get entity @p[tag=SD_adder] SelectedItem.Count
scoreboard players operation nbcrate SD_tempC += nbplayer SD_tempC 
execute if score nbcrate SD_tempC <= maxCount SD_tempC store result entity @s Item.tag.data.Count long 1 run scoreboard players get nbcrate SD_tempC 
execute if score nbcrate SD_tempC <= maxCount SD_tempC run item replace entity @p[tag=SD_adder] weapon.mainhand with air
#Display and reset


execute unless score nbcrate SD_tempC <= maxCount SD_tempC run function simpledrawer:working/fill/fullfill


function simpledrawer:working/display