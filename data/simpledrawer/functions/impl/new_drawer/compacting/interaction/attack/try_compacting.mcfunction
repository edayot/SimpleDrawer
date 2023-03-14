


scoreboard players operation #search_id simpledrawer.math = @s simpledrawer.new_drawer.id
scoreboard players operation #slot simpledrawer.io = @s simpledrawer.new_drawer.part_id

execute as @e[tag=simpledrawer.new_drawer.part.base,predicate=simpledrawer:search_id_new_drawer,distance=..10] run function simpledrawer:impl/new_drawer/compacting/interaction/attack/try_compacting_2



