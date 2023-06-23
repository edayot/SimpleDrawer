

execute store result score #model simpledrawer.math run data get entity @s item.tag.CustomModelData
execute unless data entity @s item.tag.simpledrawer{globalCount:0} run function simpledrawer:impl/new_drawer/single/destroy_filled
execute store result storage simpledrawer:main temp.dropped_item.tag.CustomModelData int 1 run scoreboard players get #model simpledrawer.math

data modify storage simpledrawer:main temp.dropped_item.tag.Trim.material set from entity @s item.tag.simpledrawer.wood_type

