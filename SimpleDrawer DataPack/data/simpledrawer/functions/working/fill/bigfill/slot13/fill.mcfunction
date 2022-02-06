execute store result score nbcrate simpledrawer.tempC run data get entity @s Item.tag.data.Count
execute store result score nbplayer simpledrawer.tempC run data get entity @p[tag=simpledrawer.adder] Inventory[{Slot:13b}].Count
scoreboard players operation nbcrate simpledrawer.tempC += nbplayer simpledrawer.tempC 
execute if score nbcrate simpledrawer.tempC <= maxCount simpledrawer.tempC store result entity @s Item.tag.data.Count long 1 run scoreboard players get nbcrate simpledrawer.tempC 
execute if score nbcrate simpledrawer.tempC <= maxCount simpledrawer.tempC run item replace entity @p[tag=simpledrawer.adder] container.13 with air

execute unless score nbcrate simpledrawer.tempC <= maxCount simpledrawer.tempC run function simpledrawer:working/fill/bigfill/slot13/fullfill

    