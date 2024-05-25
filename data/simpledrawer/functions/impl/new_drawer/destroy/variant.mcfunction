
execute
    if data storage simpledrawer:main temp.simpledrawer{type:"compacting",variant:"normal"}
    store result entity @s Item.components."minecraft:container"[0].item.components."minecraft:custom_data".simpledrawer.slot_count byte 1
    run scoreboard players get #temp_slot_count simpledrawer.math

