# @public

execute if score simpledrawer load.status matches 1 if entity @s[tag=!simpledrawer.new_drawer.tape,tag=simpledrawer.new_drawer.base,tag=simpledrawer.new_drawer.hopper,predicate=simpledrawer:impl/test_version] run function simpledrawer:impl/new_drawer/itemio/auto_handled_input

execute 
    if score simpledrawer load.status matches 1 
    if entity @s[
        tag=simpledrawer.drawer_controller,
    ] run function ~/drawer_controller:

        scoreboard players set #success_connector simpledrawer.math 0

        execute
            as @e[tag=simpledrawer.new_drawer.base,distance=..10,sort=nearest]
            run function ~/check_success:
                execute
                    if score #success_connector simpledrawer.math matches 0
                    run function ~/check_input:
                        scoreboard players set #slot simpledrawer.io -2
                        data modify storage simpledrawer:io input set from storage itemio:io input
                        execute 
                            if score #ifsneak simpledrawer.math matches 0
                            run data modify storage simpledrawer:io input.count set value 1
                        
                        function simpledrawer:impl/new_drawer/working/io/input

                        execute if score #success simpledrawer.io matches 1 run scoreboard players operation #count_to_remove itemio.io = #count_insert simpledrawer.io
                        execute if score #success simpledrawer.io matches 1 run scoreboard players set #success_input itemio.io 0
                        execute if score #success simpledrawer.io matches 1 run scoreboard players set #success_input itemio.io 1
                        execute if score #success simpledrawer.io matches 1 run data modify storage itemio:io output set from storage simpledrawer:io output
                        execute if score #success simpledrawer.io matches 1 run scoreboard players set #success_connector simpledrawer.math 1

                        execute if score #success simpledrawer.io matches 0 if score #servos_transfer itemio.math matches 1 run function #itemio:calls/disable_servo



