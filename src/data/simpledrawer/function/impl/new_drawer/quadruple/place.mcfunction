
scoreboard players set #part_index simpledrawer.new_drawer.part_id 0
data remove storage simpledrawer:main temp.item_stored
data modify storage simpledrawer:main temp.item_stored set from storage simpledrawer:main temp.simpledrawer_container[{slot:0}].item

execute positioned ~ ~0.375 ~ positioned ^-0.25 ^ ^0.505 summon text_display run function simpledrawer:impl/new_drawer/quadruple/place/text_display
execute positioned ~ ~0.25 ~ positioned ^-0.25 ^ ^0.51 summon item_display run function simpledrawer:impl/new_drawer/quadruple/place/item_display
execute positioned ~ ~0.025 ~ positioned ^-0.25 ^ ^0.29 summon interaction run function simpledrawer:impl/new_drawer/quadruple/place/interaction





scoreboard players set #part_index simpledrawer.new_drawer.part_id 1
data remove storage simpledrawer:main temp.item_stored
data modify storage simpledrawer:main temp.item_stored set from storage simpledrawer:main temp.simpledrawer_container[{slot:1}].item

execute positioned ~ ~-0.505 ~ positioned ~ ~0.375 ~ positioned ^-0.25 ^ ^0.505 summon text_display run function simpledrawer:impl/new_drawer/quadruple/place/text_display
execute positioned ~ ~-0.505 ~ positioned ~ ~0.25 ~ positioned ^-0.25 ^ ^0.51 summon item_display run function simpledrawer:impl/new_drawer/quadruple/place/item_display
execute positioned ~ ~-0.505 ~ positioned ~ ~0.025 ~ positioned ^-0.25 ^ ^0.29 summon interaction run function simpledrawer:impl/new_drawer/quadruple/place/interaction


scoreboard players set #part_index simpledrawer.new_drawer.part_id 2
data remove storage simpledrawer:main temp.item_stored
data modify storage simpledrawer:main temp.item_stored set from storage simpledrawer:main temp.simpledrawer_container[{slot:2}].item

execute positioned ~ ~0.375 ~ positioned ^0.25 ^ ^0.505 summon text_display run function simpledrawer:impl/new_drawer/quadruple/place/text_display
execute positioned ~ ~0.25 ~ positioned ^0.25 ^ ^0.51 summon item_display run function simpledrawer:impl/new_drawer/quadruple/place/item_display
execute positioned ~ ~0.025 ~ positioned ^0.25 ^ ^0.29 summon interaction run function simpledrawer:impl/new_drawer/quadruple/place/interaction





scoreboard players set #part_index simpledrawer.new_drawer.part_id 3
data remove storage simpledrawer:main temp.item_stored
data modify storage simpledrawer:main temp.item_stored set from storage simpledrawer:main temp.simpledrawer_container[{slot:3}].item

execute positioned ~ ~-0.505 ~ positioned ~ ~0.375 ~ positioned ^0.25 ^ ^0.505 summon text_display run function simpledrawer:impl/new_drawer/quadruple/place/text_display
execute positioned ~ ~-0.505 ~ positioned ~ ~0.25 ~ positioned ^0.25 ^ ^0.51 summon item_display run function simpledrawer:impl/new_drawer/quadruple/place/item_display
execute positioned ~ ~-0.505 ~ positioned ~ ~0.025 ~ positioned ^0.25 ^ ^0.29 summon interaction run function simpledrawer:impl/new_drawer/quadruple/place/interaction





execute positioned ~ ~ ~ positioned ^ ^ ^0.505 summon text_display run function simpledrawer:impl/new_drawer/quadruple/place/maxcount
