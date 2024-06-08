

scoreboard players set #initCount simpledrawer.math -1
execute store result score #initCount simpledrawer.math run data get entity @s item.components."minecraft:container"[{slot:20}].item.count
execute if data entity @s item.components."minecraft:custom_data".simpledrawer.set_count_0_20 run scoreboard players set #initCount simpledrawer.math -1



execute if score #initCount simpledrawer.math matches 1.. if score #count simpledrawer.io >= #initCount simpledrawer.math run function simpledrawer:impl/new_drawer/working/io/20/output/sup
execute if score #initCount simpledrawer.math matches 1.. if score #count simpledrawer.io < #initCount simpledrawer.math run function simpledrawer:impl/new_drawer/working/io/20/output/normal


