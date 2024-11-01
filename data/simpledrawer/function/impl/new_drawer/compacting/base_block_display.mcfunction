
execute 
    if score #temp_slot_count simpledrawer.math matches 1
    run data modify entity @s item.components."minecraft:item_model" set value f"simpledrawer:new_drawer/comp_1"

execute
    if score #temp_slot_count simpledrawer.math matches 2
    run data modify entity @s item.components."minecraft:item_model" set value f"simpledrawer:new_drawer/comp_2"

execute
    if score #temp_slot_count simpledrawer.math matches 3
    run data modify entity @s item.components."minecraft:item_model" set value f"simpledrawer:new_drawer/comp_3"
