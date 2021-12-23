execute store result score nbcrate SD_tempC run data get entity @s Item.tag.data.Count
execute store result score nbplayer SD_tempC run data get entity @p[tag=SD_adder] Inventory[{Slot:27b}].Count
scoreboard players operation nbcrate SD_tempC += nbplayer SD_tempC 
execute if score nbcrate SD_tempC <= maxCount SD_tempC store result entity @s Item.tag.data.Count long 1 run scoreboard players get nbcrate SD_tempC 
execute if score nbcrate SD_tempC <= maxCount SD_tempC run item replace entity @p[tag=SD_adder] container.27 with air

execute unless score nbcrate SD_tempC <= maxCount SD_tempC run function simpledrawer:working/fill/bigfill/slot27/fullfill

    