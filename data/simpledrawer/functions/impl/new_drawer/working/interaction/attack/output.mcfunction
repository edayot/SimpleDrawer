
scoreboard players set #count simpledrawer.io 1
execute if score #ifsneak simpledrawer.math matches 1 run scoreboard players set #count simpledrawer.io 64



scoreboard players operation #slot simpledrawer.io = @s simpledrawer.new_drawer.part_id

execute as @e[tag=simpledrawer.new_drawer.part.base,predicate=simpledrawer:search_id_new_drawer,distance=..10] run function simpledrawer:impl/new_drawer/working/io/output

execute if score #success simpledrawer.io matches 1 run function simpledrawer:impl/new_drawer/working/interaction/attack/drop
