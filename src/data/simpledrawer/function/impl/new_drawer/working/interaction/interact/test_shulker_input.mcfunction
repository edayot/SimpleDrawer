
scoreboard players set #if_item simpledrawer.math 1
execute if score #ifsneak simpledrawer.math matches 0 run return run function simpledrawer:impl/new_drawer/working/interaction/interact/input
scoreboard players set #is_shulker_box simpledrawer.math 0


execute if score #is_shulker_box simpledrawer.math matches 0 if data storage simpledrawer:main temp.SelectedItem{id:"minecraft:shulker_box"} run scoreboard players set #is_shulker_box simpledrawer.math 1
execute if score #is_shulker_box simpledrawer.math matches 0 if data storage simpledrawer:main temp.SelectedItem{id:"minecraft:white_shulker_box"} run scoreboard players set #is_shulker_box simpledrawer.math 1
execute if score #is_shulker_box simpledrawer.math matches 0 if data storage simpledrawer:main temp.SelectedItem{id:"minecraft:orange_shulker_box"} run scoreboard players set #is_shulker_box simpledrawer.math 1
execute if score #is_shulker_box simpledrawer.math matches 0 if data storage simpledrawer:main temp.SelectedItem{id:"minecraft:magenta_shulker_box"} run scoreboard players set #is_shulker_box simpledrawer.math 1
execute if score #is_shulker_box simpledrawer.math matches 0 if data storage simpledrawer:main temp.SelectedItem{id:"minecraft:light_blue_shulker_box"} run scoreboard players set #is_shulker_box simpledrawer.math 1
execute if score #is_shulker_box simpledrawer.math matches 0 if data storage simpledrawer:main temp.SelectedItem{id:"minecraft:yellow_shulker_box"} run scoreboard players set #is_shulker_box simpledrawer.math 1
execute if score #is_shulker_box simpledrawer.math matches 0 if data storage simpledrawer:main temp.SelectedItem{id:"minecraft:lime_shulker_box"} run scoreboard players set #is_shulker_box simpledrawer.math 1
execute if score #is_shulker_box simpledrawer.math matches 0 if data storage simpledrawer:main temp.SelectedItem{id:"minecraft:pink_shulker_box"} run scoreboard players set #is_shulker_box simpledrawer.math 1
execute if score #is_shulker_box simpledrawer.math matches 0 if data storage simpledrawer:main temp.SelectedItem{id:"minecraft:gray_shulker_box"} run scoreboard players set #is_shulker_box simpledrawer.math 1
execute if score #is_shulker_box simpledrawer.math matches 0 if data storage simpledrawer:main temp.SelectedItem{id:"minecraft:light_gray_shulker_box"} run scoreboard players set #is_shulker_box simpledrawer.math 1
execute if score #is_shulker_box simpledrawer.math matches 0 if data storage simpledrawer:main temp.SelectedItem{id:"minecraft:cyan_shulker_box"} run scoreboard players set #is_shulker_box simpledrawer.math 1
execute if score #is_shulker_box simpledrawer.math matches 0 if data storage simpledrawer:main temp.SelectedItem{id:"minecraft:purple_shulker_box"} run scoreboard players set #is_shulker_box simpledrawer.math 1
execute if score #is_shulker_box simpledrawer.math matches 0 if data storage simpledrawer:main temp.SelectedItem{id:"minecraft:blue_shulker_box"} run scoreboard players set #is_shulker_box simpledrawer.math 1
execute if score #is_shulker_box simpledrawer.math matches 0 if data storage simpledrawer:main temp.SelectedItem{id:"minecraft:brown_shulker_box"} run scoreboard players set #is_shulker_box simpledrawer.math 1
execute if score #is_shulker_box simpledrawer.math matches 0 if data storage simpledrawer:main temp.SelectedItem{id:"minecraft:green_shulker_box"} run scoreboard players set #is_shulker_box simpledrawer.math 1
execute if score #is_shulker_box simpledrawer.math matches 0 if data storage simpledrawer:main temp.SelectedItem{id:"minecraft:red_shulker_box"} run scoreboard players set #is_shulker_box simpledrawer.math 1
execute if score #is_shulker_box simpledrawer.math matches 0 if data storage simpledrawer:main temp.SelectedItem{id:"minecraft:black_shulker_box"} run scoreboard players set #is_shulker_box simpledrawer.math 1



execute if score #is_shulker_box simpledrawer.math matches 0 run return run function simpledrawer:impl/new_drawer/working/interaction/interact/input


execute unless loaded -30000000 20 1610 run return fail

scoreboard players operation #search_id simpledrawer.math = @s simpledrawer.new_drawer.id
scoreboard players set #slot simpledrawer.io -1

scoreboard players set #one_success simpledrawer.math 0

data modify storage simpledrawer:main temp.looping_container set from storage simpledrawer:main temp.SelectedItem.components."minecraft:container"

execute 
    as @e[tag=simpledrawer.new_drawer.part.base,predicate=simpledrawer:impl/search_id_new_drawer,distance=..10,predicate=simpledrawer:impl/test_version] 
    if data storage simpledrawer:main temp.looping_container[0]
    run function simpledrawer:impl/new_drawer/working/interaction/interact/test_shulker_input/loop with storage simpledrawer:main temp.looping_container[0]


function simpledrawer:impl/new_drawer/working/interaction/interact/test_shulker_input/loop:
    data remove storage simpledrawer:io input
    data modify storage simpledrawer:io input set from storage simpledrawer:main temp.looping_container[0].item
    execute store result score #countItem simpledrawer.math run data get storage simpledrawer:io input.count

    function simpledrawer:impl/new_drawer/working/io/input

    execute unless score #success simpledrawer.io matches 1 run data remove storage simpledrawer:main temp.looping_container[0]
    execute unless score #success simpledrawer.io matches 1 run return run execute if data storage simpledrawer:main temp.looping_container[0] run function simpledrawer:impl/new_drawer/working/interaction/interact/test_shulker_input/loop with storage simpledrawer:main temp.looping_container[0]

    scoreboard players set #one_success simpledrawer.math 1

    scoreboard players set #new_count_item simpledrawer.math 0
    scoreboard players operation #new_count_item simpledrawer.math = #countItem simpledrawer.math
    scoreboard players operation #new_count_item simpledrawer.math -= #count_insert simpledrawer.io

    $execute \
        unless score #new_count_item simpledrawer.math matches 0 \
        store result storage simpledrawer:main temp.SelectedItem.components."minecraft:container"[{slot:$(slot)}].item.count int 1 \
        run scoreboard players get #new_count_item simpledrawer.math
    $execute \
        if score #new_count_item simpledrawer.math matches 0 \
        run data remove storage simpledrawer:main temp.SelectedItem.components."minecraft:container"[{slot:$(slot)}]
    
    data remove storage simpledrawer:main temp.looping_container[0]
    execute if data storage simpledrawer:main temp.looping_container[0] run function simpledrawer:impl/new_drawer/working/interaction/interact/test_shulker_input/loop with storage simpledrawer:main temp.looping_container[0]

execute 
    if score #one_success simpledrawer.math matches 1
    in minecraft:overworld
    run function simpledrawer:impl/new_drawer/working/interaction/interact/replace_shulker_box_storage:
        setblock -30000000 22 1610 air
        setblock -30000000 22 1610 yellow_shulker_box
        data modify storage simpledrawer:main temp.SelectedItem.Slot set value 0b
        data modify block -30000000 22 1610 Items append from storage simpledrawer:main temp.SelectedItem
        item replace entity @p[tag=simpledrawer.interacter] weapon.mainhand from block -30000000 22 1610 container.0

