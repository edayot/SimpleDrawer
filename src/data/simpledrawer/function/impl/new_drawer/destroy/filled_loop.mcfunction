


scoreboard players set #count_destroy simpledrawer.math -1
function ./get_count_destroy with storage simpledrawer:main temp.ItemsDestroy[0]

function ./get_count_destroy:
    $execute store result score #count_destroy simpledrawer.math run data get storage simpledrawer:main temp.simpledrawer.items_counts.$(slot)

data modify storage simpledrawer:main temp.destroy_id set from storage simpledrawer:main temp.ItemsDestroy[0].item.id

scoreboard players set #success_item simpledrawer.math 0
execute 
    if score #success_item simpledrawer.math matches 0 
    if data storage simpledrawer:main temp.ItemsDestroy[0].item.components."minecraft:custom_name"
    store result score #success_item simpledrawer.math 
    unless data storage simpledrawer:main temp{destroy_id:"minecraft:air"}
    run item modify entity @s container.0 simpledrawer:impl/destroy/custom_name

execute 
    if score #success_item simpledrawer.math matches 0 
    if data storage simpledrawer:main temp.ItemsDestroy[0].item.components."minecraft:item_name"
    store result score #success_item simpledrawer.math 
    unless data storage simpledrawer:main temp{destroy_id:"minecraft:air"}
    run item modify entity @s container.0 simpledrawer:impl/destroy/item_name

execute 
    if score #success_item simpledrawer.math matches 0 
    store result score #success_item simpledrawer.math 
    unless data storage simpledrawer:main temp{destroy_id:"minecraft:air"}
    run function ./fallback_translations

data remove storage simpledrawer:main temp.ItemsDestroy[0]
execute if data storage simpledrawer:main temp.ItemsDestroy[0] run function ./filled_loop
