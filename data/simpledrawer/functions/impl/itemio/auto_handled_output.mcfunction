# @public

execute if entity @s[tag=simpledrawer.drawer.block,tag=simpledrawer.drawer.hopper] run function simpledrawer:impl/itemio/auto_handled_output_2
execute if entity @s[tag=simpledrawer.new_drawer.base,tag=simpledrawer.new_drawer.hopper] run function simpledrawer:impl/new_drawer/itemio/auto_handled_output

