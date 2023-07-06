
scoreboard players set #count simpledrawer.io 1






scoreboard players operation #slot simpledrawer.io = @s simpledrawer.new_drawer.part_id

scoreboard players set #success simpledrawer.io 0
execute as @e[tag=simpledrawer.new_drawer.part.base,predicate=simpledrawer:search_id_new_drawer,distance=..10] run function simpledrawer:impl/new_drawer/working/interaction/attack/output_2

execute if score #success simpledrawer.io matches 1 run function simpledrawer:impl/new_drawer/working/interaction/attack/drop

