

scoreboard players set #success simpledrawer.io 1
scoreboard players set #modified_slot simpledrawer.io 22


data modify storage simpledrawer:io output set from entity @s item.components."minecraft:custom_data".simpledrawer.Items[{Slot:22}]
execute store result storage simpledrawer:io output.Count int 1 run scoreboard players get #count simpledrawer.io
scoreboard players operation #count_output simpledrawer.io = #count simpledrawer.io

scoreboard players operation #newCount simpledrawer.math = #initCount simpledrawer.math
scoreboard players operation #newCount simpledrawer.math -= #count simpledrawer.io

scoreboard players operation #newGlobalCount simpledrawer.math = #globalCount simpledrawer.math
scoreboard players operation #newGlobalCount simpledrawer.math -= #count simpledrawer.io

execute store result entity @s item.components."minecraft:custom_data".simpledrawer.globalCount int 1 run scoreboard players get #newGlobalCount simpledrawer.math


execute store result entity @s item.components."minecraft:custom_data".simpledrawer.Items[{Slot:22}].Count int 1 run scoreboard players get #newCount simpledrawer.math




