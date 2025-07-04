


# Inputs
# A item in storage simpledrawer.io input
# A score #slot simpledrawer.io support up to 27 slots in the drawer; specials are :
# -1 for checking all slot
# -2 for checking all slot unless the slot is empty

# A score #disable_display simpledrawer.io to disable the display of the drawer

# Outputs
# The item in storage simpledrawer.io output
# The 
# The score #success simpledrawer.io for success
# -3 for bad item
# -2 for full error
# -1 for input error, 
# 0 for others error
# say INPUT





scoreboard players set #success simpledrawer.io 0
data remove storage simpledrawer:io output

execute if score #slot simpledrawer.io matches 27.. run scoreboard players set #success simpledrawer.io -1
execute if score #slot simpledrawer.io matches ..-3 run scoreboard players set #success simpledrawer.io -1

scoreboard players set #good_item simpledrawer.math 1
function #simpledrawer:disabled_input
execute unless score #good_item simpledrawer.math matches 1 run scoreboard players set #success simpledrawer.io -3


execute store result score #inputCount simpledrawer.math run data get storage simpledrawer:io input.count
execute store result score #maxCount simpledrawer.math run data get entity @s item.components."minecraft:custom_data".simpledrawer.maxCount
execute store result score #globalCount simpledrawer.math run data get entity @s item.components."minecraft:custom_data".simpledrawer.globalCount

execute if score #globalCount simpledrawer.math >= #maxCount simpledrawer.math run scoreboard players set #success simpledrawer.io -2

execute if score #good_item simpledrawer.math matches 1 unless score #success simpledrawer.io matches ..-1 unless score #slot simpledrawer.io matches ..-1 run function simpledrawer:impl/new_drawer/working/io/input_check
execute if score #good_item simpledrawer.math matches 1 unless score #success simpledrawer.io matches ..-1 if score #slot simpledrawer.io matches ..-1 run function simpledrawer:impl/new_drawer/working/io/input_all

execute 
    if score #success simpledrawer.io matches 1
    if data entity @s item.components."minecraft:custom_data".simpledrawer{type:"compacting",variant:"normal"} 
    run function simpledrawer:impl/new_drawer/working/io/compacting_input:
        scoreboard players set #none simpledrawer.math 0
        execute 
            if data entity @s item.components."minecraft:custom_data".simpledrawer{current_material:"none"}
            run function simpledrawer:impl/new_drawer/working/io/compacting_input/none

        execute 
            if score #none simpledrawer.math matches 0 
            run function simpledrawer:impl/new_drawer/working/io/compacting_input/normal





# define function
function simpledrawer:impl/new_drawer/working/io/compacting_input/function_call:
    scoreboard players set #success_material simpledrawer.io 0
    data remove storage simpledrawer:io material
    function #simpledrawer:material
    function simpledrawer:impl/new_drawer/compacting/calls/material
    scoreboard players set #nugget_in_block simpledrawer.io -1
    scoreboard players operation #nugget_in_block simpledrawer.io = #nugget_in_ingot simpledrawer.io
    scoreboard players operation #nugget_in_block simpledrawer.io *= #ingot_in_block simpledrawer.io
    
    execute 
        if score #success_material simpledrawer.io matches 1
        run function simpledrawer:impl/new_drawer/working/io/compacting_input/function_call_2:
            scoreboard players set @s simpledrawer.new_drawer.slot_count 3
            execute 
                unless data storage simpledrawer:io material.nugget
                run function simpledrawer:impl/new_drawer/working/io/compacting_input/function_call_3:
                    scoreboard players set @s simpledrawer.new_drawer.slot_count 2
            
            data modify storage simpledrawer:io material.block.slot set value 0
            data modify storage simpledrawer:io material.ingot.slot set value 1
            execute 
                if data storage simpledrawer:io material.nugget
                run data modify storage simpledrawer:io material.nugget.slot set value 2

            data modify storage simpledrawer:io material.block.item.count set value 1
            data modify storage simpledrawer:io material.ingot.item.count set value 1
            execute 
                if data storage simpledrawer:io material.nugget
                run data modify storage simpledrawer:io material.nugget.item.count set value 1
    


function simpledrawer:impl/new_drawer/working/io/compacting_input/display_items:

    scoreboard players set #no_material simpledrawer.math 0
    execute 
        unless data storage simpledrawer:io material 
        run function simpledrawer:impl/new_drawer/working/io/compacting_input/display_items/nothing:
            scoreboard players set #no_material simpledrawer.math 1
            scoreboard players operation #search_id simpledrawer.math = @s simpledrawer.new_drawer.id

            scoreboard players set #search_slot simpledrawer.math 0
            execute at @s run data remove entity @e[tag=simpledrawer.new_drawer.part.item_display,limit=1,predicate=simpledrawer:impl/search_id_slot_new_drawer,distance=..10] item

            scoreboard players set #search_slot simpledrawer.math 1
            execute at @s run data remove entity @e[tag=simpledrawer.new_drawer.part.item_display,limit=1,predicate=simpledrawer:impl/search_id_slot_new_drawer,distance=..10] item

            scoreboard players set #search_slot simpledrawer.math 2
            execute at @s run data remove entity @e[tag=simpledrawer.new_drawer.part.item_display,limit=1,predicate=simpledrawer:impl/search_id_slot_new_drawer,distance=..10] item
    execute if score #no_material simpledrawer.math matches 1 run return 0


    data modify storage simpledrawer:main items_display set from storage simpledrawer:io material

    scoreboard players operation #search_id simpledrawer.math = @s simpledrawer.new_drawer.id
    scoreboard players set #search_slot simpledrawer.math 0
    execute at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.item_display,limit=1,predicate=simpledrawer:impl/search_id_slot_new_drawer,distance=..10] item set from storage simpledrawer:main items_display.block.item

    scoreboard players set #search_slot simpledrawer.math 1
    execute at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.item_display,limit=1,predicate=simpledrawer:impl/search_id_slot_new_drawer,distance=..10] item set from storage simpledrawer:main items_display.ingot.item

    scoreboard players set #search_slot simpledrawer.math 2
    execute 
        if score @s simpledrawer.new_drawer.slot_count matches 3
        at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.item_display,limit=1,predicate=simpledrawer:impl/search_id_slot_new_drawer,distance=..10] item set from storage simpledrawer:main items_display.nugget.item

    execute 
        if score @s simpledrawer.new_drawer.slot_count matches 1
        at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.item_display,limit=1,predicate=simpledrawer:impl/search_id_slot_new_drawer,distance=..10] item set from storage simpledrawer:main items_display.nugget.item

    execute
        if score @s simpledrawer.new_drawer.slot_count matches 2
        at @s run data remove entity @e[tag=simpledrawer.new_drawer.part.item_display,limit=1,predicate=simpledrawer:impl/search_id_slot_new_drawer,distance=..10] item


function simpledrawer:impl/new_drawer/working/io/compacting_input/none:
    scoreboard players set #none simpledrawer.math 1
    scoreboard players set @s simpledrawer.new_drawer.slot_count 1

    data remove storage simpledrawer:io item_material
    data modify storage simpledrawer:io item_material set from entity @s item.components."minecraft:container"[{slot:0}].item
    # Check if the input is a valid material
    function simpledrawer:impl/new_drawer/working/io/compacting_input/function_call
    execute 
        if score #success_material simpledrawer.io matches 1
        run function simpledrawer:impl/new_drawer/working/io/compacting_input/apply_material:
            data modify entity @s item.components."minecraft:custom_data".simpledrawer.current_material set from storage simpledrawer:io material.material
            data modify entity @s item.components."minecraft:custom_data".simpledrawer.current_material_name set from storage simpledrawer:io material.material_name
            execute 
                store result score #count_drawer simpledrawer.math 
                run data get entity @s item.components."minecraft:custom_data".simpledrawer.items_counts.0

            # different count depending on the type of the material
            execute 
                if score #type simpledrawer.io matches 0
                run function simpledrawer:impl/new_drawer/working/io/compacting_input/apply_material/block:
                    
                    scoreboard players operation #nb_block simpledrawer.math = #count_drawer simpledrawer.math

                    scoreboard players operation #nb_ingot simpledrawer.math = #count_drawer simpledrawer.math
                    scoreboard players operation #nb_ingot simpledrawer.math *= #ingot_in_block simpledrawer.io

                    scoreboard players operation #nb_nugget simpledrawer.math = #count_drawer simpledrawer.math
                    scoreboard players operation #nb_nugget simpledrawer.math *= #nugget_in_block simpledrawer.io

            
            execute
                if score #type simpledrawer.io matches 1
                run function simpledrawer:impl/new_drawer/working/io/compacting_input/apply_material/ingot:
                    scoreboard players operation #nb_block simpledrawer.math = #count_drawer simpledrawer.math
                    scoreboard players operation #nb_block simpledrawer.math /= #ingot_in_block simpledrawer.io

                    scoreboard players operation #nb_ingot simpledrawer.math = #count_drawer simpledrawer.math

                    scoreboard players operation #nb_nugget simpledrawer.math = #count_drawer simpledrawer.math
                    scoreboard players operation #nb_nugget simpledrawer.math *= #nugget_in_ingot simpledrawer.io
            
            execute
                if score #type simpledrawer.io matches 2
                run function simpledrawer:impl/new_drawer/working/io/compacting_input/apply_material/nugget:
                    scoreboard players operation #nb_block simpledrawer.math = #count_drawer simpledrawer.math
                    scoreboard players operation #nb_block simpledrawer.math /= #nugget_in_block simpledrawer.io

                    scoreboard players operation #nb_ingot simpledrawer.math = #count_drawer simpledrawer.math
                    scoreboard players operation #nb_ingot simpledrawer.math /= #nugget_in_ingot simpledrawer.io

                    scoreboard players operation #nb_nugget simpledrawer.math = #count_drawer simpledrawer.math 


            data modify entity @s item.components."minecraft:custom_data".simpledrawer.items_counts.0 set value 0
            data modify entity @s item.components."minecraft:custom_data".simpledrawer.items_counts.1 set value 0
            data modify entity @s item.components."minecraft:custom_data".simpledrawer.items_counts.2 set value 0

            execute 
                store result entity @s item.components."minecraft:custom_data".simpledrawer.items_counts.0 int 1
                run scoreboard players get #nb_block simpledrawer.math
            execute
                store result entity @s item.components."minecraft:custom_data".simpledrawer.items_counts.1 int 1
                run scoreboard players get #nb_ingot simpledrawer.math
            execute
                if data storage simpledrawer:io material.nugget
                store result entity @s item.components."minecraft:custom_data".simpledrawer.items_counts.2 int 1
                run scoreboard players get #nb_nugget simpledrawer.math
            
            data modify entity @s item.components."minecraft:container" set value []
            data modify entity @s item.components."minecraft:container" append from storage simpledrawer:io material.block
            data modify entity @s item.components."minecraft:container" append from storage simpledrawer:io material.ingot
            execute if data storage simpledrawer:io material.nugget run data modify entity @s item.components."minecraft:container" append from storage simpledrawer:io material.nugget

            execute store result entity @s item.components."minecraft:custom_data".simpledrawer.globalCount int 1 run scoreboard players get #nb_block simpledrawer.math
            function simpledrawer:impl/new_drawer/working/io/compacting_input/display_items


function simpledrawer:impl/new_drawer/working/io/compacting_input/normal:
    data remove storage simpledrawer:io item_material
    data modify storage simpledrawer:io item_material set from storage simpledrawer:io input

    # Check if the input is a valid material
    function simpledrawer:impl/new_drawer/working/io/compacting_input/function_call

    execute
        if score #success_material simpledrawer.io matches 1
        run function simpledrawer:impl/new_drawer/working/io/compacting_input/normal/add_others:
            execute
                store result score #nb_block simpledrawer.math 
                run data get entity @s item.components."minecraft:custom_data".simpledrawer.items_counts.0

            execute 
                store result score #nb_ingot simpledrawer.math 
                run data get entity @s item.components."minecraft:custom_data".simpledrawer.items_counts.1

            execute 
                if data storage simpledrawer:io material.nugget 
                store result score #nb_nugget simpledrawer.math 
                run data get entity @s item.components."minecraft:custom_data".simpledrawer.items_counts.2

            execute
                unless data storage simpledrawer:io material.nugget 
                run function simpledrawer:impl/new_drawer/working/io/compacting_input/normal/no_nugget:
                    scoreboard players operation #nb_nugget simpledrawer.math = #nb_ingot simpledrawer.math
                    scoreboard players operation #nb_nugget simpledrawer.math *= #nugget_in_ingot simpledrawer.io
            
            execute 
                if score #type simpledrawer.io matches 0
                run function simpledrawer:impl/new_drawer/working/io/compacting_input/normal/add_others/block:

                    scoreboard players operation #ingot_to_add simpledrawer.math = #ingot_in_block simpledrawer.io
                    scoreboard players operation #ingot_to_add simpledrawer.math *= #count_insert simpledrawer.io

                    scoreboard players operation #nugget_to_add simpledrawer.math = #nugget_in_block simpledrawer.io
                    scoreboard players operation #nugget_to_add simpledrawer.math *= #count_insert simpledrawer.io
                    
                    scoreboard players operation #nb_ingot simpledrawer.math += #ingot_to_add simpledrawer.math
                    scoreboard players operation #nb_nugget simpledrawer.math +=  #nugget_to_add simpledrawer.math
            execute
                if score #type simpledrawer.io matches 1
                run function simpledrawer:impl/new_drawer/working/io/compacting_input/normal/add_others/ingot:

                    scoreboard players operation #nugget_to_add simpledrawer.math = #nugget_in_ingot simpledrawer.io
                    scoreboard players operation #nugget_to_add simpledrawer.math *= #count_insert simpledrawer.io

                    scoreboard players operation #nb_nugget simpledrawer.math += #nugget_to_add simpledrawer.math

                    scoreboard players operation #nb_block simpledrawer.math = #nb_ingot simpledrawer.math
                    scoreboard players operation #nb_block simpledrawer.math /= #ingot_in_block simpledrawer.io
            execute
                if score #type simpledrawer.io matches 2
                run function simpledrawer:impl/new_drawer/working/io/compacting_input/normal/add_others/nugget:
                    scoreboard players operation #nb_block simpledrawer.math = #nb_nugget simpledrawer.math
                    scoreboard players operation #nb_block simpledrawer.math /= #nugget_in_block simpledrawer.io

                    scoreboard players operation #nb_ingot simpledrawer.math = #nb_nugget simpledrawer.math
                    scoreboard players operation #nb_ingot simpledrawer.math /= #nugget_in_ingot simpledrawer.io

            data modify entity @s item.components."minecraft:custom_data".simpledrawer.items_counts.0 set value 0
            data modify entity @s item.components."minecraft:custom_data".simpledrawer.items_counts.1 set value 0
            data modify entity @s item.components."minecraft:custom_data".simpledrawer.items_counts.2 set value 0

            execute 
                store result entity @s item.components."minecraft:custom_data".simpledrawer.items_counts.0 int 1
                run scoreboard players get #nb_block simpledrawer.math
            execute
                store result entity @s item.components."minecraft:custom_data".simpledrawer.items_counts.1 int 1
                run scoreboard players get #nb_ingot simpledrawer.math
            execute
                if data storage simpledrawer:io material.nugget
                store result entity @s item.components."minecraft:custom_data".simpledrawer.items_counts.2 int 1
                run scoreboard players get #nb_nugget simpledrawer.math
            
            data modify entity @s item.components."minecraft:container" set value []
            data modify entity @s item.components."minecraft:container" append from storage simpledrawer:io material.block
            data modify entity @s item.components."minecraft:container" append from storage simpledrawer:io material.ingot
            execute if data storage simpledrawer:io material.nugget run data modify entity @s item.components."minecraft:container" append from storage simpledrawer:io material.nugget

            execute store result entity @s item.components."minecraft:custom_data".simpledrawer.globalCount int 1 run scoreboard players get #nb_block simpledrawer.math
            function simpledrawer:impl/new_drawer/working/io/compacting_input/display_items
        
    execute
        if score #success_material simpledrawer.io matches 0
        run function simpledrawer:impl/new_drawer/working/io/compacting_input/normal/clear_others:
            scoreboard players set @s simpledrawer.new_drawer.slot_count 1

            data remove storage simpledrawer:main temp_item
            execute 
                if score #modified_slot simpledrawer.io matches 0
                run data modify storage simpledrawer:main temp_item set from entity @s item.components."minecraft:container"[{slot:0}]
            execute
                if score #modified_slot simpledrawer.io matches 1
                run data modify storage simpledrawer:main temp_item set from entity @s item.components."minecraft:container"[{slot:1}]
            execute
                if score #modified_slot simpledrawer.io matches 2
                run data modify storage simpledrawer:main temp_item set from entity @s item.components."minecraft:container"[{slot:2}]
            

            data modify entity @s item.components."minecraft:container" set value []
            data modify entity @s item.components."minecraft:custom_data".simpledrawer.current_material set value "none"
            data modify entity @s item.components."minecraft:custom_data".simpledrawer.current_material_name set value '{"text":"none"}'
            execute 
                if score #modified_slot simpledrawer.io matches 0
                run data modify entity @s item.components."minecraft:custom_data".simpledrawer.items_counts.0 set from entity @s item.components."minecraft:custom_data".simpledrawer.items_counts.0
            execute
                if score #modified_slot simpledrawer.io matches 1
                run data modify entity @s item.components."minecraft:custom_data".simpledrawer.items_counts.0 set from entity @s item.components."minecraft:custom_data".simpledrawer.items_counts.1
            execute
                if score #modified_slot simpledrawer.io matches 2
                run data modify entity @s item.components."minecraft:custom_data".simpledrawer.items_counts.0 set from entity @s item.components."minecraft:custom_data".simpledrawer.items_counts.2
            data modify entity @s item.components."minecraft:custom_data".simpledrawer.items_counts.1 set value 0
            data modify entity @s item.components."minecraft:custom_data".simpledrawer.items_counts.2 set value 0

            data modify storage simpledrawer:main temp_item.slot set value 0
            data modify entity @s item.components."minecraft:container" append from storage simpledrawer:main temp_item

            data modify entity @s item.components."minecraft:custom_data".simpledrawer.globalCount set from entity @s item.components."minecraft:custom_data".simpledrawer.items_counts.0

            # display items
            scoreboard players operation #search_id simpledrawer.math = @s simpledrawer.new_drawer.id
            scoreboard players set #search_slot simpledrawer.math 0
            execute at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.item_display,limit=1,predicate=simpledrawer:impl/search_id_slot_new_drawer,distance=..10] item set from storage simpledrawer:main temp_item

            scoreboard players set #search_slot simpledrawer.math 1
            execute at @s run data remove entity @e[tag=simpledrawer.new_drawer.part.item_display,limit=1,predicate=simpledrawer:impl/search_id_slot_new_drawer,distance=..10] item

            scoreboard players set #search_slot simpledrawer.math 2
            execute at @s run data remove entity @e[tag=simpledrawer.new_drawer.part.item_display,limit=1,predicate=simpledrawer:impl/search_id_slot_new_drawer,distance=..10] item




    
    

execute 
    if score #success simpledrawer.io matches 1 
    if score #disable_display simpledrawer.io matches 0
    run function simpledrawer:impl/new_drawer/base_display

scoreboard players set #disable_display simpledrawer.io 0

