
execute at @s at @p[tag=simpledrawer.adder] run summon item ~ ~ ~ {Tags:["simpledrawer.summoned"],Item:{id:"minecraft:stone",Count:1b}}


scoreboard players remove nbstack simpledrawer.tempC 1
execute if score nbstack simpledrawer.tempC matches 1.. run function simpledrawer:working/unfill/drop_bigunfill