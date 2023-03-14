
data remove storage simpledrawer:io input_compacting
data modify storage simpledrawer:io input_compacting set from entity @s item.tag.simpledrawer.Items[{Slot:0}]


scoreboard players operation #search_id simpledrawer.math = @s simpledrawer.new_drawer.id
execute at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.item_display_nugget,limit=1,predicate=simpledrawer:search_id_slot_new_drawer,distance=..10] item set from storage simpledrawer:io input_compacting

scoreboard players set #success_compacting simpledrawer.io 0
function #simpledrawer:get_ingot
execute at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.item_display_ingot,limit=1,predicate=simpledrawer:search_id_slot_new_drawer,distance=..10] item set from storage simpledrawer:io output_compacting

scoreboard players set #success_compacting simpledrawer.io 0
function #simpledrawer:get_block
execute at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.item_display_block,limit=1,predicate=simpledrawer:search_id_slot_new_drawer,distance=..10] item set from storage simpledrawer:io output_compacting


