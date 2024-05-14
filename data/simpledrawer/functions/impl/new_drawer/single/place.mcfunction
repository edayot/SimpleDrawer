

scoreboard players set #part_index simpledrawer.new_drawer.part_id 0
data modify storage simpledrawer:main temp.item_stored set value {id:"minecraft:air",count:0}
data modify storage simpledrawer:main temp.item_stored set from storage simpledrawer:main temp.simpledrawer.Items[{Slot:0}]

execute positioned ~ ~0.275 ~ positioned ^ ^ ^0.505 summon text_display run function simpledrawer:impl/new_drawer/single/place/text_display
execute positioned ~ ~-0.05 ~ positioned ^ ^ ^0.51 summon item_display run function simpledrawer:impl/new_drawer/single/place/item_display
execute positioned ~ ~-0.4 ~ positioned ^ ^ ^0.1 summon interaction run function simpledrawer:impl/new_drawer/single/place/interaction



