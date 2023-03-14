

scoreboard players set #part_index simpledrawer.new_drawer.part_id 0
data modify storage simpledrawer:main temp.item_stored set value {id:"minecraft:air"}
data modify storage simpledrawer:main temp.item_stored set from storage simpledrawer:main temp.simpledrawer.Items[{Slot:0}]

execute positioned ~ ~0.275 ~ positioned ^ ^ ^0.505 summon text_display run function simpledrawer:impl/new_drawer/compacting/place/text_display


execute positioned ~ ~0 ~ positioned ^ ^ ^0.2 summon interaction run function simpledrawer:impl/new_drawer/compacting/place/interaction_nugget
execute positioned ~ ~1 ~ positioned ^ ^ ^0.2 summon interaction run function simpledrawer:impl/new_drawer/compacting/place/interaction_ingot
execute positioned ~ ~2 ~ positioned ^ ^ ^0.2 summon interaction run function simpledrawer:impl/new_drawer/compacting/place/interaction_block


execute positioned ~ ~0 ~ positioned ^ ^ ^0.505 summon item_display run function simpledrawer:impl/new_drawer/compacting/place/item_display_nugget
execute positioned ~ ~1 ~ positioned ^ ^ ^0.505 summon item_display run function simpledrawer:impl/new_drawer/compacting/place/item_display_ingot
execute positioned ~ ~2 ~ positioned ^ ^ ^0.505 summon item_display run function simpledrawer:impl/new_drawer/compacting/place/item_display_block
