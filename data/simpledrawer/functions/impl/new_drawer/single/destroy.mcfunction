

execute store result score #model simpledrawer.math run data get entity @s item.tag.CustomModelData
execute unless data entity @s item.tag.simpledrawer{globalCount:0} run scoreboard players add #model simpledrawer.math 1
execute store result storage simpledrawer:main temp.dropped_item.tag.CustomModelData int 1 run scoreboard players get #model simpledrawer.math