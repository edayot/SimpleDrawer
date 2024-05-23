
scoreboard players set #part_index simpledrawer.new_drawer.part_id 0
data remove storage simpledrawer:main temp.item_stored
data modify storage simpledrawer:main temp.item_stored set from storage simpledrawer:main temp.simpledrawer.Items[{Slot:0}]

execute positioned ~ ~0.375 ~ positioned ^ ^ ^0.505 summon text_display run function simpledrawer:impl/new_drawer/double/place/text_display
execute positioned ~ ~0.225 ~ positioned ^ ^ ^0.51 summon item_display run function simpledrawer:impl/new_drawer/double/place/item_display
execute positioned ~ ~0.075 ~ positioned ^ ^ ^0.1 summon interaction run function simpledrawer:impl/new_drawer/double/place/interaction





scoreboard players set #part_index simpledrawer.new_drawer.part_id 1
data remove storage simpledrawer:main temp.item_stored
data modify storage simpledrawer:main temp.item_stored set from storage simpledrawer:main temp.simpledrawer.Items[{Slot:1}]

execute positioned ~ ~-0.505 ~ positioned ~ ~0.375 ~ positioned ^ ^ ^0.505 summon text_display run function simpledrawer:impl/new_drawer/double/place/text_display
execute positioned ~ ~-0.505 ~ positioned ~ ~0.225 ~ positioned ^ ^ ^0.51 summon item_display run function simpledrawer:impl/new_drawer/double/place/item_display
execute positioned ~ ~-0.505 ~ positioned ~ ~0.075 ~ positioned ^ ^ ^0.1 summon interaction run function simpledrawer:impl/new_drawer/double/place/interaction



execute positioned ~ ~ ~ positioned ^ ^ ^0.505 summon text_display run function simpledrawer:impl/new_drawer/double/place/maxcount
