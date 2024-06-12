# Inputs
# Take #count simpledrawer.io as input

# A score #slot simpledrawer.io (-1 for checking all slot) support up to 27 slots in the drawer

# Outputs
# The item in storage simpledrawer.io output
# The 
# The score #success simpledrawer.io for success (-2 for full error, -1 for input error, 0 for others error)

scoreboard players set #success simpledrawer.io 0
data remove storage simpledrawer:io output



execute if score #slot simpledrawer.io matches 27.. run scoreboard players set #success simpledrawer.io -1
execute if score #slot simpledrawer.io matches ..-2 run scoreboard players set #success simpledrawer.io -1

execute if score #count simpledrawer.io matches ..0 run scoreboard players set #success simpledrawer.io -1

execute store result score #globalCount simpledrawer.math run data get entity @s item.components."minecraft:custom_data".simpledrawer.globalCount


execute unless score #success simpledrawer.io matches ..-1 run function simpledrawer:impl/new_drawer/working/io/output_check 



execute 
    if score #success simpledrawer.io matches 1
    if data entity @s item.components."minecraft:custom_data".simpledrawer{type:"compacting",variant:"normal"} 
    run function simpledrawer:impl/new_drawer/working/io/compacting_output:
        scoreboard players set #none simpledrawer.math 0
        execute 
            if data entity @s item.components."minecraft:custom_data".simpledrawer{current_material:"none"}
            run function simpledrawer:impl/new_drawer/working/io/compacting_output/none

        execute 
            if score #none simpledrawer.math matches 0 
            run function simpledrawer:impl/new_drawer/working/io/compacting_output/normal


function simpledrawer:impl/new_drawer/working/io/compacting_output/none:
    scoreboard players set #none simpledrawer.math 1


function simpledrawer:impl/new_drawer/working/io/compacting_output/normal:    
    data remove storage simpledrawer:io item_material
    data modify storage simpledrawer:io item_material set from storage simpledrawer:io output
    function simpledrawer:impl/new_drawer/working/io/compacting_input/function_call

    execute
        if score #success_material simpledrawer.io matches 1
        run function simpledrawer:impl/new_drawer/working/io/compacting_output/normal/remove_others:
            data modify entity @s item.components."minecraft:custom_data".simpledrawer.current_material set from storage simpledrawer:io material.material
            data modify entity @s item.components."minecraft:custom_data".simpledrawer.current_material_name set from storage simpledrawer:io material.material_name

            scoreboard players set #nb_block simpledrawer.math 0
            scoreboard players set #nb_ingot simpledrawer.math 0
            scoreboard players set #nb_nugget simpledrawer.math 0
            execute
                store result score #nb_block simpledrawer.math 
                run data get entity @s item.components."minecraft:container"[{slot:0}].item.count

            execute 
                store result score #nb_ingot simpledrawer.math 
                run data get entity @s item.components."minecraft:container"[{slot:1}].item.count

            execute 
                if data storage simpledrawer:io material.nugget
                store result score #nb_nugget simpledrawer.math 
                run data get entity @s item.components."minecraft:container"[{slot:2}].item.count

            execute 
                store result score #output_count simpledrawer.math
                run data get storage simpledrawer:io output.count

            execute 
                if score #type simpledrawer.io matches 0
                run function simpledrawer:impl/new_drawer/working/io/compacting_output/normal/remove_others/block:

                    scoreboard players operation #ingot_to_remove simpledrawer.math = #ingot_in_block simpledrawer.io
                    scoreboard players operation #ingot_to_remove simpledrawer.math *= #output_count simpledrawer.math

                    scoreboard players operation #nugget_to_remove simpledrawer.math = #nugget_in_block simpledrawer.io
                    scoreboard players operation #nugget_to_remove simpledrawer.math *= #output_count simpledrawer.math

                    scoreboard players operation #nb_ingot simpledrawer.math -= #ingot_to_remove simpledrawer.math
                    scoreboard players operation #nb_nugget simpledrawer.math -= #nugget_to_remove simpledrawer.math

            execute
                if score #type simpledrawer.io matches 1
                run function simpledrawer:impl/new_drawer/working/io/compacting_output/normal/remove_others/ingot:
                    scoreboard players operation #nb_block simpledrawer.math = #nb_ingot simpledrawer.math
                    scoreboard players operation #nb_block simpledrawer.math /= #ingot_in_block simpledrawer.io

                    scoreboard players operation #nugget_to_remove simpledrawer.math = #nugget_in_ingot simpledrawer.io
                    scoreboard players operation #nugget_to_remove simpledrawer.math *= #output_count simpledrawer.math

                    scoreboard players operation #nb_nugget simpledrawer.math -= #nugget_to_remove simpledrawer.math

            execute
                if score #type simpledrawer.io matches 2
                run function simpledrawer:impl/new_drawer/working/io/compacting_output/normal/remove_others/nugget:
                    scoreboard players operation #nb_block simpledrawer.math = #nb_nugget simpledrawer.math
                    scoreboard players operation #nb_block simpledrawer.math /= #nugget_in_block simpledrawer.io

                    scoreboard players operation #nb_ingot simpledrawer.math = #nb_nugget simpledrawer.math
                    scoreboard players operation #nb_ingot simpledrawer.math /= #nugget_in_ingot simpledrawer.io

            execute 
                store result storage simpledrawer:io material.block.item.count int 1 
                run scoreboard players get #nb_block simpledrawer.math
            execute
                store result storage simpledrawer:io material.ingot.item.count int 1 
                run scoreboard players get #nb_ingot simpledrawer.math
            execute
                if data storage simpledrawer:io material.nugget
                store result storage simpledrawer:io material.nugget.item.count int 1 
                run scoreboard players get #nb_nugget simpledrawer.math

            data modify entity @s item.components."minecraft:container" set value []
            execute unless score #nb_block simpledrawer.math matches 0 run data modify entity @s item.components."minecraft:container" append from storage simpledrawer:io material.block
            execute unless score #nb_ingot simpledrawer.math matches 0 run data modify entity @s item.components."minecraft:container" append from storage simpledrawer:io material.ingot
            execute unless score #nb_nugget simpledrawer.math matches 0 if data storage simpledrawer:io material.nugget run data modify entity @s item.components."minecraft:container" append from storage simpledrawer:io material.nugget

            data remove entity @s item.components."minecraft:custom_data".simpledrawer.set_count_0_0
            data remove entity @s item.components."minecraft:custom_data".simpledrawer.set_count_0_1
            data remove entity @s item.components."minecraft:custom_data".simpledrawer.set_count_0_2
            execute if score #nb_block simpledrawer.math matches 0 run data modify storage simpledrawer:io material.block.item.count set value 1
            execute if score #nb_block simpledrawer.math matches 0 run data modify entity @s item.components."minecraft:custom_data".simpledrawer.set_count_0_0 set value 1
            execute if score #nb_block simpledrawer.math matches 0 run data modify entity @s item.components."minecraft:container" append from storage simpledrawer:io material.block
            execute if score #nb_ingot simpledrawer.math matches 0 run data modify storage simpledrawer:io material.ingot.item.count set value 1
            execute if score #nb_ingot simpledrawer.math matches 0 run data modify entity @s item.components."minecraft:custom_data".simpledrawer.set_count_0_1 set value 1
            execute if score #nb_ingot simpledrawer.math matches 0 run data modify entity @s item.components."minecraft:container" append from storage simpledrawer:io material.ingot

            scoreboard players operation #total_item simpledrawer.math = #nb_ingot simpledrawer.math
            execute
                if data storage simpledrawer:io material.nugget
                run scoreboard players operation #total_item simpledrawer.math = #nb_nugget simpledrawer.math

            execute store result entity @s item.components."minecraft:custom_data".simpledrawer.globalCount int 1 run scoreboard players get #nb_block simpledrawer.math
            function simpledrawer:impl/new_drawer/working/io/compacting_input/display_items
    execute
        if score #success_material simpledrawer.io matches 0
        run function simpledrawer:impl/new_drawer/working/io/compacting_output/normal/failed:
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

            data modify storage simpledrawer:main temp_item.slot set value 0
            data modify entity @s item.components."minecraft:container" append from storage simpledrawer:main temp_item

            data modify entity @s item.components."minecraft:custom_data".simpledrawer.globalCount set from storage simpledrawer:main temp_item.item.count

            execute store result score #total_item simpledrawer.math run data get entity @s item.components."minecraft:custom_data".simpledrawer.globalCount

            # display items
            scoreboard players operation #search_id simpledrawer.math = @s simpledrawer.new_drawer.id
            scoreboard players set #search_slot simpledrawer.math 0
            data modify storage simpledrawer:main temp_item.count set value 1
            execute at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.item_display,limit=1,predicate=simpledrawer:impl/search_id_slot_new_drawer,distance=..10] item set from storage simpledrawer:main temp_item.item

            scoreboard players set #search_slot simpledrawer.math 1
            execute at @s run data remove entity @e[tag=simpledrawer.new_drawer.part.item_display,limit=1,predicate=simpledrawer:impl/search_id_slot_new_drawer,distance=..10] item

            scoreboard players set #search_slot simpledrawer.math 2
            execute at @s run data remove entity @e[tag=simpledrawer.new_drawer.part.item_display,limit=1,predicate=simpledrawer:impl/search_id_slot_new_drawer,distance=..10] item

    execute
        if score #total_item simpledrawer.math matches 0
        run function simpledrawer:impl/new_drawer/working/io/compacting_output/normal/clear_all:
            scoreboard players set @s simpledrawer.new_drawer.slot_count 1
            data modify entity @s item.components."minecraft:container" set value []
            data modify entity @s item.components."minecraft:custom_data".simpledrawer.globalCount set value 0

            data modify entity @s item.components."minecraft:custom_data".simpledrawer.current_material set value "none"
            data modify entity @s item.components."minecraft:custom_data".simpledrawer.current_material_name set value '{"text":"none"}'

            data remove entity @s item.components."minecraft:custom_data".simpledrawer.set_count_0_0
            data remove entity @s item.components."minecraft:custom_data".simpledrawer.set_count_0_1
            data remove entity @s item.components."minecraft:custom_data".simpledrawer.set_count_0_2

            data remove storage simpledrawer:io material
            function simpledrawer:impl/new_drawer/working/io/compacting_input/display_items


function ./store_count
function simpledrawer:impl/new_drawer/base_display
