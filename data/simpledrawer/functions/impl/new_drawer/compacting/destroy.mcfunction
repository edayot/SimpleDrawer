
data modify storage simpledrawer:main temp.dropped_item.tag.display set from storage simpledrawer:main ItemsNBT.compacting_new_drawer.tag.display


scoreboard players set #model simpledrawer.math 1430000
execute unless data entity @s item.tag.simpledrawer{globalCount:0} run function simpledrawer:impl/new_drawer/compacting/destroy_filled
execute store result storage simpledrawer:main temp.dropped_item.tag.CustomModelData int 1 run scoreboard players get #model simpledrawer.math

data modify storage simpledrawer:main temp.dropped_item.tag.Trim.material set from entity @s item.tag.simpledrawer.wood_type

