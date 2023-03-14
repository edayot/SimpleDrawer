tag @s add simpledrawer.new_drawer.part
tag @s add simpledrawer.new_drawer.part.interaction_block
tag @s add simpledrawer.new_drawer.part.interaction_compacting


scoreboard players operation @s simpledrawer.new_drawer.id = #global simpledrawer.new_drawer.id
scoreboard players operation @s simpledrawer.new_drawer.part_id = #part_index simpledrawer.new_drawer.part_id


data merge entity @s {width:0.625,height:0.625}