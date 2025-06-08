

data modify storage simpledrawer:main temp.Inventory set from entity @p[tag=simpledrawer.interacter] Inventory
data remove storage simpledrawer:main temp.Inventory[{Slot:100b}]
data remove storage simpledrawer:main temp.Inventory[{Slot:101b}]
data remove storage simpledrawer:main temp.Inventory[{Slot:102b}]
data remove storage simpledrawer:main temp.Inventory[{Slot:103b}]
data remove storage simpledrawer:main temp.Inventory[{Slot:-106b}]





execute
    as @e[tag=simpledrawer.new_drawer.base,distance=..10,sort=nearest]
    run function ~/loop_inventory:
        data remove storage simpledrawer:main temp.InventoryLoop
        data modify storage simpledrawer:main temp.InventoryLoop set from storage simpledrawer:main temp.Inventory
        execute
            if data storage simpledrawer:main temp.InventoryLoop[0]
            run function ~/check_input:
                scoreboard players set #slot simpledrawer.io -2
                data modify storage simpledrawer:io input set from storage simpledrawer:main temp.InventoryLoop[0]
                
                function simpledrawer:impl/new_drawer/working/io/input
                # Check if the drawer is full of items
                execute if score #success simpledrawer.io matches -2 run return fail

                execute 
                    if score #success simpledrawer.io matches 1 
                    run function ~/on_success with storage simpledrawer:main temp.InventoryLoop[0]
                        
                function ~/on_success:
                    $item modify entity @p[tag=simpledrawer.interacter] container.$(Slot) simpledrawer:impl/remove_count_output
                    data modify storage simpledrawer:main temp.Inventory set from entity @p[tag=simpledrawer.interacter] Inventory
                    data remove storage simpledrawer:main temp.Inventory[{Slot:100b}]
                    data remove storage simpledrawer:main temp.Inventory[{Slot:101b}]
                    data remove storage simpledrawer:main temp.Inventory[{Slot:102b}]
                    data remove storage simpledrawer:main temp.Inventory[{Slot:103b}]
                    data remove storage simpledrawer:main temp.Inventory[{Slot:-106b}]
                    
                    data remove storage simpledrawer:main temp.InventoryLoop[0]
                    execute
                        if data storage simpledrawer:main temp.InventoryLoop[0]
                        run function ~/../../check_input

                execute
                    unless score #success simpledrawer.io matches 1
                    run function ~/on_fail:
                        
                        data remove storage simpledrawer:main temp.InventoryLoop[0]
                        execute
                            if data storage simpledrawer:main temp.InventoryLoop[0]
                            run function ~/../../check_input




