

scoreboard players set #model simpledrawer.math 1430000
execute unless data storage simpledrawer:main temp.simpledrawer{globalCount:0} run function simpledrawer:impl/new_drawer/single/destroy_filled
execute store result storage simpledrawer:main temp.dropped_item.tag.CustomModelData int 1 run scoreboard players get #model simpledrawer.math

data modify storage simpledrawer:main temp.dropped_item.components."minecraft:trim".material set from storage simpledrawer:main temp.simpledrawer.wood_type

