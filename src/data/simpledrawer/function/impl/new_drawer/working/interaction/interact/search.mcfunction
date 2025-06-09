
scoreboard players set #test_player simpledrawer.math 0

scoreboard players set #timestamp simpledrawer.math -1
execute store result score #timestamp simpledrawer.math run data get entity @s interaction.timestamp

execute if score #timestamp simpledrawer.math = #gametime simpledrawer.math on target if entity @s[tag=simpledrawer.interacter] run scoreboard players set #test_player simpledrawer.math 1

scoreboard players set #if_item simpledrawer.math 0


scoreboard players operation #search_id simpledrawer.math = @s simpledrawer.new_drawer.id

execute 
    if score #test_player simpledrawer.math matches 1
    as @e[
        tag=simpledrawer.new_drawer.tape,
        tag=simpledrawer.new_drawer.part.base,
        predicate=simpledrawer:impl/search_id_new_drawer,
        distance=..10,
        predicate=simpledrawer:impl/test_version
    ] run return run tag @s remove simpledrawer.new_drawer.tape

execute if score #test_player simpledrawer.math matches 1 if data storage simpledrawer:main temp.SelectedItem run function simpledrawer:impl/new_drawer/working/interaction/interact/test_shulker_input
execute if score #test_player simpledrawer.math matches 1 if score #if_item simpledrawer.math matches 0 if score #ifsneak simpledrawer.math matches 1 run function simpledrawer:impl/new_drawer/working/interaction/interact/big_input




execute if score #test_player simpledrawer.math matches 1 run scoreboard players set #found simpledrawer.math 1
