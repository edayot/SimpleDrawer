scoreboard players set #if_item simpledrawer.math 1

data remove storage simpledrawer:io input
data modify storage simpledrawer:io input set from storage simpledrawer:main temp.SelectedItem





scoreboard players operation #search_id simpledrawer.math = @s simpledrawer.new_drawer.id
scoreboard players operation #slot simpledrawer.io = @s simpledrawer.new_drawer.part_id




execute as @e[tag=simpledrawer.new_drawer.part.base,predicate=simpledrawer:search_id_new_drawer,distance=..10] run function simpledrawer:impl/new_drawer/compacting/interaction/modified_interact/input_2

execute if score #success simpledrawer.io matches 1 run function simpledrawer:impl/new_drawer/compacting/interaction/modified_interact/remove_count
execute if score #success simpledrawer.io matches ..0 run function simpledrawer:impl/new_drawer/compacting/interaction/modified_interact/error
