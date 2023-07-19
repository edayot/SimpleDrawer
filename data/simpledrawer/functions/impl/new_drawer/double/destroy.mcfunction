


data modify storage simpledrawer:main temp.dropped_item.tag.display set from storage simpledrawer:main ItemsNBT.double_new_drawer.tag.display

scoreboard players set #model simpledrawer.math 1430001
execute unless data storage simpledrawer:main temp.simpledrawer{globalCount:0} run function simpledrawer:impl/new_drawer/double/destroy_filled
execute store result storage simpledrawer:main temp.dropped_item.tag.CustomModelData int 1 run scoreboard players get #model simpledrawer.math

data modify storage simpledrawer:main temp.dropped_item.tag.Trim.material set from storage simpledrawer:main temp.simpledrawer.wood_type

