
execute as @e[tag=simpledrawer.new_drawer.base,predicate=!simpledrawer:impl/destroyer_new_drawer,predicate=simpledrawer:impl/test_version] at @s run function simpledrawer:impl/new_drawer/destroy



execute as @a run function simpledrawer:impl/tick_player

scoreboard players set #count_summon simpledrawer.math 0
execute as @e[tag=simpledrawer.new_drawer.part.base] at @s run function simpledrawer:impl/new_drawer/tick



schedule function simpledrawer:impl/tick 1t replace
