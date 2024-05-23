



execute store result score #count_destroy simpledrawer.math run data get storage simpledrawer:main temp.ItemsDestroy[0].count

scoreboard players set #success_item simpledrawer.math 0
execute 
    if score #success_item simpledrawer.math matches 0 
    if data storage simpledrawer:main temp.ItemsDestroy[0].components."minecraft:custom_name"
    store result score #success_item simpledrawer.math 
    run item modify entity @s container.0 simpledrawer:impl/destroy/custom_name

execute 
    if score #success_item simpledrawer.math matches 0 
    if data storage simpledrawer:main temp.ItemsDestroy[0].components."minecraft:item_name"
    store result score #success_item simpledrawer.math 
    run item modify entity @s container.0 simpledrawer:impl/destroy/item_name


data remove storage simpledrawer:main temp.ItemsDestroy[0]
execute if data storage simpledrawer:main temp.ItemsDestroy[0] run function ./filled_loop
