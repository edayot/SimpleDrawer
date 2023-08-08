
execute if data storage simpledrawer:main temp.simpledrawer{type:"normal"} run function simpledrawer:impl/new_drawer/normal/place


execute if data storage simpledrawer:main temp.simpledrawer{type:"normal",variant:"single"} run function simpledrawer:impl/new_drawer/single/place
execute if data storage simpledrawer:main temp.simpledrawer{type:"normal",variant:"double"} run function simpledrawer:impl/new_drawer/double/place
execute if data storage simpledrawer:main temp.simpledrawer{type:"normal",variant:"quadruple"} run function simpledrawer:impl/new_drawer/quadruple/place


execute if data storage simpledrawer:main temp.simpledrawer{type:"compacting",variant:"normal"} run function simpledrawer:impl/new_drawer/compacting/place

