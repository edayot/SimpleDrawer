
data modify storage simpledrawer:main temp.simpledrawerXX set from entity @s item.tag.simpledrawer


execute store success score #if_player_around simpledrawer.math if entity @a[distance=..15]

 
execute if score #if_player_around simpledrawer.math matches 0 run tag @s add simpledrawer.new_drawer.to_update


execute if score #if_player_around simpledrawer.math matches 1 if data storage simpledrawer:main temp.simpledrawerXX{type:"normal"} run function simpledrawer:impl/new_drawer/normal/base_display


execute if score #if_player_around simpledrawer.math matches 1 if data storage simpledrawer:main temp.simpledrawerXX{type:"normal",variant:"single"} run function simpledrawer:impl/new_drawer/single/base_display
execute if score #if_player_around simpledrawer.math matches 1 if data storage simpledrawer:main temp.simpledrawerXX{type:"normal",variant:"double"} run function simpledrawer:impl/new_drawer/double/base_display
execute if score #if_player_around simpledrawer.math matches 1 if data storage simpledrawer:main temp.simpledrawerXX{type:"normal",variant:"quadruple"} run function simpledrawer:impl/new_drawer/quadruple/base_display



execute if score #if_player_around simpledrawer.math matches 1 if data storage simpledrawer:main temp.simpledrawerXX{type:"compacting",variant:"normal"} run function simpledrawer:impl/new_drawer/normal/base_display

execute if score #if_player_around simpledrawer.math matches 1 if data storage simpledrawer:main temp.simpledrawerXX{type:"compacting",variant:"normal"} run function simpledrawer:impl/new_drawer/compacting/base_display


