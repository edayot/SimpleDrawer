# @public

execute if score simpledrawer load.status matches 1 if entity @s[tag=simpledrawer.new_drawer.base,tag=simpledrawer.new_drawer.hopper,predicate=simpledrawer:impl/test_version] run function simpledrawer:impl/new_drawer/itemio/auto_handled_output

