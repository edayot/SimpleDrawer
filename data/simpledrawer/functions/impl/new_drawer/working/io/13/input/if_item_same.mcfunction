
scoreboard players set #success simpledrawer.io 1
scoreboard players set #modified_slot simpledrawer.io 13

data modify storage simpledrawer:io output set from storage simpledrawer:io input


scoreboard players operation #newGlobalCount simpledrawer.math = #globalCount simpledrawer.math 
scoreboard players operation #newGlobalCount simpledrawer.math += #inputCount simpledrawer.math 


execute store result score #initCount simpledrawer.math run data get entity @s item.components."minecraft:custom_data".simpledrawer.Items[{Slot:13}].count
scoreboard players operation #newCount simpledrawer.math = #initCount simpledrawer.math 
scoreboard players operation #newCount simpledrawer.math += #inputCount simpledrawer.math 

execute if score #newGlobalCount simpledrawer.math > #maxCount simpledrawer.math run function simpledrawer:impl/new_drawer/working/io/13/input/over


# apply new count
execute store result entity @s item.components."minecraft:custom_data".simpledrawer.globalCount int 1 run scoreboard players get #newGlobalCount simpledrawer.math
execute store result entity @s item.components."minecraft:custom_data".simpledrawer.Items[{Slot:13}].count int 1 run scoreboard players get #newCount simpledrawer.math

scoreboard players operation #count_insert simpledrawer.io = #newCount simpledrawer.math
scoreboard players operation #count_insert simpledrawer.io -= #initCount simpledrawer.math


