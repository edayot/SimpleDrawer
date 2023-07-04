

scoreboard players operation #search_id simpledrawer.math = @s simpledrawer.new_drawer.id




execute if data entity @s item.tag.simpledrawer{hopper:1b} at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.hopper_display,limit=1,predicate=simpledrawer:search_id_new_drawer,distance=..10] item set from storage simpledrawer:main ItemsNBT.hopper_upgrade
execute if data entity @s item.tag.simpledrawer{hopper:0b} at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.hopper_display,limit=1,predicate=simpledrawer:search_id_new_drawer,distance=..10] item set value {id:"minecraft:air",Count:1b}

execute if data entity @s item.tag.simpledrawer{upgrade:"wood"} at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.upgrade_display,limit=1,predicate=simpledrawer:search_id_new_drawer,distance=..10] item set value {id:"minecraft:air",Count:1b}
execute if data entity @s item.tag.simpledrawer{upgrade:"iron"} at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.upgrade_display,limit=1,predicate=simpledrawer:search_id_new_drawer,distance=..10] item set from storage simpledrawer:main ItemsNBT.iron_upgrade
execute if data entity @s item.tag.simpledrawer{upgrade:"gold"} at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.upgrade_display,limit=1,predicate=simpledrawer:search_id_new_drawer,distance=..10] item set from storage simpledrawer:main ItemsNBT.gold_upgrade
execute if data entity @s item.tag.simpledrawer{upgrade:"diamond"} at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.upgrade_display,limit=1,predicate=simpledrawer:search_id_new_drawer,distance=..10] item set from storage simpledrawer:main ItemsNBT.diamond_upgrade
execute if data entity @s item.tag.simpledrawer{upgrade:"star"} at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.upgrade_display,limit=1,predicate=simpledrawer:search_id_new_drawer,distance=..10] item set from storage simpledrawer:main ItemsNBT.star_upgrade
execute if data entity @s item.tag.simpledrawer{upgrade:"netherite"} at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.upgrade_display,limit=1,predicate=simpledrawer:search_id_new_drawer,distance=..10] item set from storage simpledrawer:main ItemsNBT.netherite_upgrade






