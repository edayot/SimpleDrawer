
data modify storage simpledrawer:main temp.dropped_item.tag.display set from storage simpledrawer:main ItemsNBT.quadruple_new_drawer.tag.display


scoreboard players set #model simpledrawer.math 1430002
execute unless data entity @s item.components."minecraft:custom_data".simpledrawer{globalCount:0} run function simpledrawer:impl/new_drawer/quadruple/destroy_filled
execute store result storage simpledrawer:main temp.dropped_item.tag.CustomModelData int 1 run scoreboard players get #model simpledrawer.math

data modify storage simpledrawer:main temp.dropped_item.components."minecraft:trim".material set from entity @s item.components."minecraft:custom_data".simpledrawer.wood_type

