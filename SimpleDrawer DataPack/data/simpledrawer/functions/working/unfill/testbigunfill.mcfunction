
execute store result score nb simpledrawer.tempC run data get entity @s Item.tag.data.Count
execute if data entity @s Item.tag.info{stack1:0b,stack16:0b} run scoreboard players operation nb simpledrawer.tempC /= 64 simpledrawer.tempC
execute if data entity @s Item.tag.info{stack1:0b,stack16:16b} run scoreboard players operation nb simpledrawer.tempC /= 16 simpledrawer.tempC
execute if data entity @s Item.tag.info{stack1:1b,stack16:0b} run scoreboard players operation nb simpledrawer.tempC /= 1 simpledrawer.tempC

execute if score nb simpledrawer.tempC matches 1.. run function simpledrawer:working/unfill/bigunfill
execute if entity @s[tag=simpledrawer.filled] if score nb simpledrawer.tempC matches 0 run function simpledrawer:working/unfill/unfill