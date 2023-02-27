

scoreboard players set #part_index simpledrawer.new_drawer.part_id 0
data modify storage simpledrawer:main temp.item_stored set from storage simpledrawer:main temp.simpledrawer.Items[0]
execute positioned ^ ^ ^0.501 summon item_display run function simpledrawer:impl/new_drawer/single/place/item_display
execute positioned ~ ~-0.3125 ~ positioned ^ ^ ^0.2 summon interaction run function simpledrawer:impl/new_drawer/single/place/interaction
#text_display to do



