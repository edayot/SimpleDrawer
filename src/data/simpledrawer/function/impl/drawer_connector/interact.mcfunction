# @public
advancement revoke @s only simpledrawer:impl/interact_drawer_connector
execute unless score simpledrawer load.status matches 1 run return fail
playsound minecraft:entity.item_frame.add_item block @s ~ ~ ~


execute store result score #gametime simpledrawer.math run time query gametime
execute store success score #ifsneak simpledrawer.math if predicate simpledrawer:impl/sneaking

data remove storage simpledrawer:main temp.SelectedItem
data modify storage simpledrawer:main temp.SelectedItem set from entity @s SelectedItem

tag @s add simpledrawer.interacter
scoreboard players set #found simpledrawer.math 0
execute 
    as @e[tag=simpledrawer.drawer_connector.interaction,distance=..10,sort=nearest] 
    run function ~/search_test:
        execute 
            if score #found simpledrawer.math matches 0
            run function ~/search:
                scoreboard players set #test_player simpledrawer.math 0
                scoreboard players set #timestamp simpledrawer.math -1
                execute 
                    store result score #timestamp simpledrawer.math 
                    run data get entity @s interaction.timestamp
                execute 
                    if score #timestamp simpledrawer.math = #gametime simpledrawer.math 
                    on target 
                    if entity @s[tag=simpledrawer.interacter] 
                    run scoreboard players set #test_player simpledrawer.math 1

                
                execute 
                    if score #test_player simpledrawer.math matches 1 
                    if data storage simpledrawer:main temp.SelectedItem
                    run function ./input_in_drawers
                
                execute 
                    if score #test_player simpledrawer.math matches 1 
                    unless data storage simpledrawer:main temp.SelectedItem
                    if score #ifsneak simpledrawer.math matches 1
                    run function ./input_in_inventory

                execute 
                    if score #test_player simpledrawer.math matches 1 
                    run scoreboard players set #found simpledrawer.math 1


        data remove entity @s interaction
        data remove entity @s attack
execute 
    unless score #found simpledrawer.math matches 0
    run scoreboard players add @s simpledrawer.nb_click 1
tag @s remove simpledrawer.interacter



