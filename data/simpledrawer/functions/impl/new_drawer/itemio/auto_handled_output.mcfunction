
data modify storage simpledrawer:main temp.Items_aho set value []
data modify storage simpledrawer:main temp.Items_aho set from entity @s item.components."minecraft:custom_data".simpledrawer.Items

execute if data storage simpledrawer:main temp.Items_aho[0] run function simpledrawer:impl/new_drawer/itemio/auto_handled_output_loop





