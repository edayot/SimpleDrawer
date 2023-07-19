

scoreboard players set #initCount simpledrawer.math -1
execute store result score #initCount simpledrawer.math run data get entity @s item.tag.simpledrawer.Items[{Slot:3}].Count



execute if score #initCount simpledrawer.math matches 1.. if score #count simpledrawer.io >= #initCount simpledrawer.math run function simpledrawer:impl/new_drawer/working/io/3/output/sup
execute if score #initCount simpledrawer.math matches 1.. if score #count simpledrawer.io < #initCount simpledrawer.math run function simpledrawer:impl/new_drawer/working/io/3/output/normal


