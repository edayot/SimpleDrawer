# @to_update
# For newer version it will upgrade the drawer and then place it
# changes as to be made on storage smithed.custom_block:main blockApi.__data.Items[0].components."minecraft:custom_data".simpledrawer

# nothing from 1.9.0 to 1.9.1
# nothing from 1.9.1 to 1.9.2


execute
    if score #drawer.major simpledrawer.math matches 2
    if score #drawer.minor simpledrawer.math matches 6..7
    if score #drawer.patch simpledrawer.math matches 0..
    run function ./2.6_to_2.7_item:
        scoreboard players set #drawer.major simpledrawer.math 2
        scoreboard players set #drawer.minor simpledrawer.math 8
        scoreboard players set #drawer.patch simpledrawer.math 0

        execute 
            if data storage smithed.custom_block:main blockApi.__data.Items[0].components."minecraft:custom_data".simpledrawer{current_material:"simpledrawer.minecraft.copper"}
            run function ~/copper_material_upgrade:
                execute 
                    store result score #temp simpledrawer.math 
                    run data get storage smithed.custom_block:main blockApi.__data.Items[0].components."minecraft:custom_data".simpledrawer.items_counts.1
                scoreboard players operation #temp simpledrawer.math *= #9 simpledrawer.math
                execute
                    store result storage smithed.custom_block:main blockApi.__data.Items[0].components."minecraft:custom_data".simpledrawer.items_counts.2 int 1
                    run scoreboard players get #temp simpledrawer.math
                data modify storage smithed.custom_block:main blockApi.__data.Items[0].components."minecraft:container" append value {item:{id:"minecraft:copper_nugget",count:1}, slot:2}
                data modify storage smithed.custom_block:main blockApi.__data.Items[0].components."minecraft:custom_data".simpledrawer.slot_count set value 3


# store the new_drawer version automaticly
execute
    if score #drawer.major simpledrawer.math matches 2..
    run function simpledrawer:impl/new_drawer/place

