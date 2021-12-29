execute unless data entity @s Item.tag.info.stack1 run scoreboard players remove nb SD_tempC 64
execute if data entity @s Item.tag.info{stack1:0b,stack16:0b} run scoreboard players remove nb SD_tempC 64
execute if data entity @s Item.tag.info{stack1:0b,stack16:1b} run scoreboard players remove nb SD_tempC 16
execute if data entity @s Item.tag.info{stack1:1b,stack16:0b} run scoreboard players remove nb SD_tempC 1

execute store result entity @s Item.tag.data.Count long 1 run scoreboard players get nb SD_tempC 

