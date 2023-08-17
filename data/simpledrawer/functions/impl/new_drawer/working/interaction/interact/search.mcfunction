
scoreboard players set #test_player simpledrawer.math 0

scoreboard players set #timestamp simpledrawer.math -1
execute store result score #timestamp simpledrawer.math run data get entity @s interaction.timestamp

execute if score #timestamp simpledrawer.math = #gametime simpledrawer.math on target if entity @s[tag=simpledrawer.interacter] run scoreboard players set #test_player simpledrawer.math 1

scoreboard players set #if_item simpledrawer.math 0
execute if score #test_player simpledrawer.math matches 1 if data storage simpledrawer:main temp.SelectedItem run function simpledrawer:impl/new_drawer/working/interaction/interact/input
execute if score #test_player simpledrawer.math matches 1 if score #if_item simpledrawer.math matches 0 if score #ifsneak simpledrawer.math matches 1 run function simpledrawer:impl/new_drawer/working/interaction/interact/big_input




execute if score #test_player simpledrawer.math matches 1 run scoreboard players set #found simpledrawer.math 1
data remove entity @s interaction
data remove entity @s attack