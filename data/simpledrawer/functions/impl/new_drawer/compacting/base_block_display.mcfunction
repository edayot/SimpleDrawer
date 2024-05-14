data modify entity @s item.components."minecraft:trim" set value {material:"simpledrawer:compacting",pattern:"minecraft:sentry"}


data modify entity @s item.components."minecraft:custom_model_data" set value 1430000

execute 
    if score #temp_slot_count simpledrawer.math matches 1
    run data modify entity @s item.components."minecraft:custom_model_data" set value 1430000

execute 
    if score #temp_slot_count simpledrawer.math matches 2
    run data modify entity @s item.components."minecraft:custom_model_data" set value 1430001


execute
    if score #temp_slot_count simpledrawer.math matches 3
    run data modify entity @s item.components."minecraft:custom_model_data" set value 1430003

