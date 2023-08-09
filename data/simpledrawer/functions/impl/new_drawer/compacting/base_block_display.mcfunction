data modify entity @s item.tag.Trim set value {material:"simpledrawer:compacting",pattern:"minecraft:sentry"}


data modify entity @s item.tag.CustomModelData set value 1430000

execute 
    if score #temp_slot_count simpledrawer.math matches 1
    run data modify entity @s item.tag.CustomModelData set value 1430000

execute 
    if score #temp_slot_count simpledrawer.math matches 2
    run data modify entity @s item.tag.CustomModelData set value 1430001

execute
    if score #temp_slot_count simpledrawer.math matches 3
    run data modify entity @s item.tag.CustomModelData set value 1430002