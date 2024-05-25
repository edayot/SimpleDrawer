
execute store result score #model simpledrawer.math run data get entity @s Item.components."minecraft:custom_model_data"

scoreboard players add #model simpledrawer.math 3

execute store result entity @s Item.components."minecraft:custom_model_data" int 1 run scoreboard players get #model simpledrawer.math

item modify entity @s container.0 simpledrawer:impl/destroy/clear

function simpledrawer:impl/new_drawer/destroy/count with storage simpledrawer:main temp.simpledrawer


data remove storage simpledrawer:main temp.ItemsDestroy
data modify storage simpledrawer:main temp.ItemsDestroy set from storage simpledrawer:main temp.simpledrawer.Items

execute if data storage simpledrawer:main temp.ItemsDestroy[0] run function ./filled_loop



function ./add_upgrades

item modify entity @s container.0 simpledrawer:impl/destroy/last_lore
