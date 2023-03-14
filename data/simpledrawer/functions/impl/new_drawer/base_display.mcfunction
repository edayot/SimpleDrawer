
data modify storage simpledrawer:main temp.simpledrawerXX set from entity @s item.tag.simpledrawer

execute if data storage simpledrawer:main temp.simpledrawerXX{type:"normal",variant:"single"} run function simpledrawer:impl/new_drawer/single/base_display
execute if data storage simpledrawer:main temp.simpledrawerXX{type:"compacting",variant:"single"} run function simpledrawer:impl/new_drawer/compacting/base_display
execute if data storage simpledrawer:main temp.simpledrawerXX{type:"normal",variant:"double"} run function simpledrawer:impl/new_drawer/double/base_display


