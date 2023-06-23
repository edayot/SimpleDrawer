
execute if data storage simpledrawer:main temp.simpledrawer{type:"normal",variant:"single"} run function simpledrawer:impl/new_drawer/single/destroy
execute if data storage simpledrawer:main temp.simpledrawer{type:"compacting",variant:"single"} run function simpledrawer:impl/new_drawer/compacting/destroy
execute if data storage simpledrawer:main temp.simpledrawer{type:"normal",variant:"double"} run function simpledrawer:impl/new_drawer/double/destroy

