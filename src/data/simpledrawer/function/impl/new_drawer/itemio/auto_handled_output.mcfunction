
data modify storage simpledrawer:main temp.Items_aho set value []
data modify storage simpledrawer:main temp.Items_aho set from entity @s item.components."minecraft:container"

execute if data storage simpledrawer:main temp.Items_aho[0] run function simpledrawer:impl/new_drawer/itemio/auto_handled_output_loop





