
data modify storage simpledrawer:main temp.simpledrawerXX set from entity @s item.components."minecraft:custom_data".simpledrawer
data modify storage simpledrawer:main temp.simpledrawer_containerXX set from entity @s item.components."minecraft:container"


data modify entity @s item.components."minecraft:item_model" set value "simpledrawer:vide"


execute if data storage simpledrawer:main temp.simpledrawerXX{type:"normal"} run function simpledrawer:impl/new_drawer/normal/base_display


execute if data storage simpledrawer:main temp.simpledrawerXX{type:"normal",variant:"single"} run function simpledrawer:impl/new_drawer/single/base_display
execute if data storage simpledrawer:main temp.simpledrawerXX{type:"normal",variant:"double"} run function simpledrawer:impl/new_drawer/double/base_display
execute if data storage simpledrawer:main temp.simpledrawerXX{type:"normal",variant:"quadruple"} run function simpledrawer:impl/new_drawer/quadruple/base_display



execute if data storage simpledrawer:main temp.simpledrawerXX{type:"compacting",variant:"normal"} run function simpledrawer:impl/new_drawer/normal/base_display

execute if data storage simpledrawer:main temp.simpledrawerXX{type:"compacting",variant:"normal"} run function simpledrawer:impl/new_drawer/compacting/base_display



execute if score @s simpledrawer.new_drawer.no_format_cooldown matches 0 run scoreboard players set @s simpledrawer.new_drawer.no_format_cooldown -1
