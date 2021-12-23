
execute store result score nb SD_tempC run data get entity @s Item.tag.data.Count
scoreboard players operation nb SD_tempC /= 64 SD_tempC
execute if score nb SD_tempC matches 1.. run function simpledrawer:working/unfill/bigunfill
execute if score nb SD_tempC matches 0 run function simpledrawer:working/unfill/unfill