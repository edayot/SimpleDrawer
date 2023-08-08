
scoreboard players set #part_index simpledrawer.new_drawer.part_id 0
data modify storage simpledrawer:main temp.item_stored set value {id:"minecraft:air",Count:0b}
data modify storage simpledrawer:main temp.item_stored set from storage simpledrawer:main temp.simpledrawer.Items[{Slot:0}]

execute positioned ~ ~0.325 ~ positioned ^ ^ ^0.505 summon text_display run function simpledrawer:impl/new_drawer/compacting/place/text_display_top
execute positioned ~ ~0.2 ~ positioned ^ ^ ^0.51 summon item_display run function simpledrawer:impl/new_drawer/compacting/place/item_display_top
execute positioned ~ ~0.075 ~ positioned ^ ^ ^0.1 summon interaction run function simpledrawer:impl/new_drawer/compacting/place/interaction_top








scoreboard players set #part_index simpledrawer.new_drawer.part_id 1
data modify storage simpledrawer:main temp.item_stored set value {id:"minecraft:air",Count:0b}
data modify storage simpledrawer:main temp.item_stored set from storage simpledrawer:main temp.simpledrawer.Items[{Slot:1}]

execute positioned ~ ~-0.51 ~ positioned ~ ~0.325 ~ positioned ^-0.25 ^ ^0.505 summon text_display run function simpledrawer:impl/new_drawer/compacting/place/text_display
execute positioned ~ ~-0.51 ~ positioned ~ ~0.2 ~ positioned ^-0.25 ^ ^0.51 summon item_display run function simpledrawer:impl/new_drawer/compacting/place/item_display
execute positioned ~ ~-0.51 ~ positioned ~ ~0.025 ~ positioned ^-0.25 ^ ^0.29 summon interaction run function simpledrawer:impl/new_drawer/compacting/place/interaction





scoreboard players set #part_index simpledrawer.new_drawer.part_id 2
data modify storage simpledrawer:main temp.item_stored set value {id:"minecraft:air",Count:0b}
data modify storage simpledrawer:main temp.item_stored set from storage simpledrawer:main temp.simpledrawer.Items[{Slot:2}]

execute positioned ~ ~-0.51 ~ positioned ~ ~0.325 ~ positioned ^0.25 ^ ^0.505 summon text_display run function simpledrawer:impl/new_drawer/compacting/place/text_display
execute positioned ~ ~-0.51 ~ positioned ~ ~0.2 ~ positioned ^0.25 ^ ^0.51 summon item_display run function simpledrawer:impl/new_drawer/compacting/place/item_display
execute positioned ~ ~-0.51 ~ positioned ~ ~0.025 ~ positioned ^0.25 ^ ^0.29 summon interaction run function simpledrawer:impl/new_drawer/compacting/place/interaction





execute positioned ~ ~ ~ positioned ^ ^ ^0.505 summon text_display run function simpledrawer:impl/new_drawer/compacting/place/maxcount
