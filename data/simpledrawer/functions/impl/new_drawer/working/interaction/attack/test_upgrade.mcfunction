
scoreboard players operation #search_id simpledrawer.math = @s simpledrawer.new_drawer.id

scoreboard players set #if_upgrade simpledrawer.math 0
execute if data storage simpledrawer:main temp.SelectedItem.tag.simpledrawer.upgrade as @e[tag=simpledrawer.new_drawer.part.base,predicate=simpledrawer:search_id_new_drawer,distance=..10] run function simpledrawer:impl/new_drawer/working/interaction/attack/upgrade
execute if data storage simpledrawer:main temp.SelectedItem.tag.simpledrawer.downgrade as @e[tag=simpledrawer.new_drawer.part.base,predicate=simpledrawer:search_id_new_drawer,distance=..10] run function simpledrawer:impl/new_drawer/working/interaction/attack/test_downgrade

execute if score #if_upgrade simpledrawer.math matches 0 run function simpledrawer:impl/new_drawer/working/interaction/attack/output