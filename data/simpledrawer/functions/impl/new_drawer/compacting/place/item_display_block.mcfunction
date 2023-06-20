
tag @s add simpledrawer.new_drawer.part
tag @s add simpledrawer.new_drawer.part.item_display_block
tag @s add simpledrawer.new_drawer.part.item_display_compacting


scoreboard players operation @s simpledrawer.new_drawer.id = #global simpledrawer.new_drawer.id
scoreboard players operation @s simpledrawer.new_drawer.part_id = #part_index simpledrawer.new_drawer.part_id



tp @s ~ ~ ~ ~180 ~
data merge entity @s {transformation:{scale:[0.6f,0.6f,0.01f]},item_display:"gui"}

scoreboard players set #success_compacting simpledrawer.io 0
data modify storage simpledrawer:io input_compacting set from storage simpledrawer:main temp.item_stored
function #simpledrawer:get_block
execute if score #success_compacting simpledrawer.io matches 1 unless data storage simpledrawer:io output_compacting{Count:0} run data modify storage simpledrawer:io output_compacting.Count set value 1b
execute if score #success_compacting simpledrawer.io matches 1 run data modify entity @s item set from storage simpledrawer:io output_compacting
