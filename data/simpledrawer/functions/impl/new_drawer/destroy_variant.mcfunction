
execute if data storage simpledrawer:main temp.simpledrawer{type:"normal",variant:"single"} run function simpledrawer:impl/new_drawer/single/destroy
execute if data storage simpledrawer:main temp.simpledrawer{type:"normal",variant:"double"} run function simpledrawer:impl/new_drawer/double/destroy
execute if data storage simpledrawer:main temp.simpledrawer{type:"normal",variant:"quadruple"} run function simpledrawer:impl/new_drawer/quadruple/destroy


execute if data storage simpledrawer:main temp.simpledrawer{type:"compacting",variant:"normal"} run function simpledrawer:impl/new_drawer/compacting/destroy

execute if data storage simpledrawer:main temp.simpledrawer{type:"normal"} run function simpledrawer:impl/new_drawer/normal/destroy