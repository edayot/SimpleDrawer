item modify entity @s container.0 simpledrawer:impl/destroy/clear


data remove storage simpledrawer:main temp.ItemsDestroy
data modify storage simpledrawer:main temp.ItemsDestroy set from storage simpledrawer:main temp.simpledrawer.Items

execute if data storage simpledrawer:main temp.ItemsDestroy[0] run function ./filled_loop



item modify entity @s container.0 simpledrawer:impl/destroy/last_lore
