
execute at @s at @p[tag=SD_adder] run summon item ~ ~ ~ {Tags:["SD_summoned"],Item:{id:"minecraft:stone",Count:1b}}


scoreboard players remove nbstack SD_tempC 1
execute if score nbstack SD_tempC matches 1.. run function simpledrawer:working/unfill/drop_bigunfill