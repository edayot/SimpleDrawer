
execute store result score nb SD_tempC run data get entity @s Item.tag.data.Count
execute if data entity @s Item.tag.info{stack1:0b,stack16:0b} run scoreboard players operation nb SD_tempC /= 64 SD_tempC
execute if data entity @s Item.tag.info{stack1:0b,stack16:16b} run scoreboard players operation nb SD_tempC /= 16 SD_tempC
execute if data entity @s Item.tag.info{stack1:1b,stack16:0b} run scoreboard players operation nb SD_tempC /= 1 SD_tempC

execute if score nb SD_tempC matches 1.. run function simpledrawer:working/unfill/bigunfill
execute if entity @s[tag=SD_filled] if score nb SD_tempC matches 0 run function simpledrawer:working/unfill/unfill