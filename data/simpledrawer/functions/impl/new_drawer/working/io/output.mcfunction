# Inputs
# Take #count simpledrawer.io as input

# A score #slot simpledrawer.io (-1 for checking all slot) support up to 32 slots in the drawer

# Outputs
# The item in storage simpledrawer.io output
# The 
# The score #success simpledrawer.io for success (-2 for full error, -1 for input error, 0 for others error)

scoreboard players set #success simpledrawer.io 0
data remove storage simpledrawer:io output



execute if score #slot simpledrawer.io matches 32.. run scoreboard players set #success simpledrawer.io -1
execute if score #slot simpledrawer.io matches ..-2 run scoreboard players set #success simpledrawer.io -1

execute if score #count simpledrawer.io matches ..0 run scoreboard players set #success simpledrawer.io -1

execute store result score #globalCount simpledrawer.math run data get entity @s item.tag.simpledrawer.globalCount


execute unless score #success simpledrawer.io matches ..-1 run function simpledrawer:impl/new_drawer/working/io/output_check 



execute 
    if score #success simpledrawer.io matches 1
    if data entity @s item.tag.simpledrawer{type:"compacting",variant:"normal"} 
    run function simpledrawer:impl/new_drawer/working/io/compacting_output:
        scoreboard players set #none simpledrawer.math 0
        execute 
            if data entity @s item.tag.simpledrawer{current_material:"none"}
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
            execute
                store result score #nb_block simpledrawer.math 
                run data get entity @s item.tag.simpledrawer.Items[{Slot:0}].Count

            execute 
                store result score #nb_ingot simpledrawer.math 
                run data get entity @s item.tag.simpledrawer.Items[{Slot:1}].Count

            execute 
                store result score #nb_nugget simpledrawer.math 
                run data get entity @s item.tag.simpledrawer.Items[{Slot:2}].Count

            execute 
                store result score #output_count simpledrawer.math
                run data get storage simpledrawer:io output.Count

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
                store result storage simpledrawer:io material.block.Count int 1 
                run scoreboard players get #nb_block simpledrawer.math
            execute
                store result storage simpledrawer:io material.ingot.Count int 1 
                run scoreboard players get #nb_ingot simpledrawer.math
            execute
                store result storage simpledrawer:io material.nugget.Count int 1 
                run scoreboard players get #nb_nugget simpledrawer.math

            data modify entity @s item.tag.simpledrawer.Items set value []
            data modify entity @s item.tag.simpledrawer.Items append from storage simpledrawer:io material.block
            data modify entity @s item.tag.simpledrawer.Items append from storage simpledrawer:io material.ingot
            data modify entity @s item.tag.simpledrawer.Items append from storage simpledrawer:io material.nugget

            scoreboard players operation #total_item simpledrawer.math = #nb_block simpledrawer.math
            scoreboard players operation #total_item simpledrawer.math += #nb_ingot simpledrawer.math
            scoreboard players operation #total_item simpledrawer.math += #nb_nugget simpledrawer.math

            execute store result entity @s item.tag.simpledrawer.globalCount int 1 run scoreboard players get #nb_block simpledrawer.math
            function simpledrawer:impl/new_drawer/working/io/compacting_input/display_items
    
    execute
        if score #total_item simpledrawer.math matches 0
        run function simpledrawer:impl/new_drawer/working/io/compacting_output/normal/clear_all:
            scoreboard players set @s simpledrawer.new_drawer.slot_count 1
            data modify entity @s item.tag.simpledrawer.Items set value []
            data modify entity @s item.tag.simpledrawer.globalCount set value 0

            data modify entity @s item.tag.simpledrawer.current_material set value "none"

            data modify storage simpledrawer:io material set value {
                material: "simpledrawer.minecraft.iron",
                block: {id:"minecraft:air",Count:0b,Slot:0},
                ingot: {id:"minecraft:air",Count:0b,Slot:1},
                nugget: {id:"minecraft:air",Count:0b,Slot:2}
            }
            function simpledrawer:impl/new_drawer/working/io/compacting_input/display_items


function simpledrawer:impl/new_drawer/base_display
