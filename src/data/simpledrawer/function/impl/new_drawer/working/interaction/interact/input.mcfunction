
data remove storage simpledrawer:io input
data modify storage simpledrawer:io input set from storage simpledrawer:main temp.SelectedItem
execute store result score #countItem simpledrawer.math run data get storage simpledrawer:io input.count


scoreboard players set #count_input simpledrawer.math 1
execute if score #ifsneak simpledrawer.math matches 1 run scoreboard players set #count_input simpledrawer.math 64

execute if score #countItem simpledrawer.math < #count_input simpledrawer.math run scoreboard players operation #count_input simpledrawer.math = #countItem simpledrawer.math

execute store result storage simpledrawer:io input.count int 1 run scoreboard players get #count_input simpledrawer.math


scoreboard players operation #search_id simpledrawer.math = @s simpledrawer.new_drawer.id
scoreboard players operation #slot simpledrawer.io = @s simpledrawer.new_drawer.part_id


scoreboard players set #success simpledrawer.io 0
execute as @e[tag=simpledrawer.new_drawer.part.base,predicate=simpledrawer:impl/search_id_new_drawer,distance=..10,predicate=simpledrawer:impl/test_version] run function simpledrawer:impl/new_drawer/working/io/input

execute if score #success simpledrawer.io matches 1 run function simpledrawer:impl/new_drawer/working/interaction/interact/remove_count
execute if score #success simpledrawer.io matches ..0 run function simpledrawer:impl/new_drawer/working/interaction/interact/error

execute if score #success simpledrawer.io matches -2 run function simpledrawer:impl/new_drawer/working/interaction/interact/full_advancement

