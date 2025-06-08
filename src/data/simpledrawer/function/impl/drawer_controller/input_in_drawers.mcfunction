

scoreboard players set #success_connector simpledrawer.math 0

execute
    as @e[tag=simpledrawer.new_drawer.base,distance=..10,sort=nearest]
    run function ~/check_success:
        execute
            if score #success_connector simpledrawer.math matches 0
            run function ~/check_input:
                scoreboard players set #slot simpledrawer.io -2
                data modify storage simpledrawer:io input set from storage simpledrawer:main temp.SelectedItem
                execute 
                    if score #ifsneak simpledrawer.math matches 0
                    run data modify storage simpledrawer:io input.count set value 1
                
                function simpledrawer:impl/new_drawer/working/io/input
                execute 
                    if score #success simpledrawer.io matches 1 
                    run function ~/on_success:
                        function simpledrawer:impl/new_drawer/working/interaction/interact/remove_count
                        scoreboard players set #success_connector simpledrawer.math 1



