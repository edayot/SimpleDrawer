
scoreboard players set #has_material simpledrawer.math 0
execute
    if data storage simpledrawer:main temp.simpledrawer{type:"compacting",variant:"normal"}
    unless data storage simpledrawer:main temp.simpledrawer{current_material:"none"}
    run scoreboard players set #has_material simpledrawer.math 1




execute store result score #model simpledrawer.math run data get entity @s Item.components."minecraft:custom_model_data"

scoreboard players add #model simpledrawer.math 3

execute store result entity @s Item.components."minecraft:custom_model_data" int 1 run scoreboard players get #model simpledrawer.math

item modify entity @s container.0 simpledrawer:impl/destroy/clear

function simpledrawer:impl/new_drawer/destroy/count with storage simpledrawer:main temp.simpledrawer

execute
    if score #has_material simpledrawer.math matches 0
    run function ./filled_normal:
    data remove storage simpledrawer:main temp.ItemsDestroy
    data modify storage simpledrawer:main temp.ItemsDestroy set from storage simpledrawer:main temp.simpledrawer_container

    execute if data storage simpledrawer:main temp.ItemsDestroy[0].item run function ./filled_loop

execute
    if score #has_material simpledrawer.math matches 1
    run function ./filled_compacting:
        execute store result score #count_destroy simpledrawer.math run data get storage simpledrawer:main temp.simpledrawer.globalCount

        data remove storage simpledrawer:main temp.material
        data modify storage simpledrawer:main temp.material set from storage simpledrawer:main temp.simpledrawer.current_material_name

        item modify entity @s container.0 simpledrawer:impl/destroy/material

        


function ./add_upgrades

item modify entity @s container.0 simpledrawer:impl/destroy/last_lore
