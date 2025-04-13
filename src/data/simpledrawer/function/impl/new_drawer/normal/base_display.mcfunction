

scoreboard players operation #search_id simpledrawer.math = @s simpledrawer.new_drawer.id




execute if data entity @s item.components."minecraft:custom_data".simpledrawer{hopper:1b} at @s as @e[tag=simpledrawer.new_drawer.part.hopper_display,limit=1,predicate=simpledrawer:impl/search_id_new_drawer,distance=..10] run loot replace entity @s container.0 loot simpledrawer:impl/items/hopper_upgrade
execute if data entity @s item.components."minecraft:custom_data".simpledrawer{hopper:0b} at @s as @e[tag=simpledrawer.new_drawer.part.hopper_display,limit=1,predicate=simpledrawer:impl/search_id_new_drawer,distance=..10] run item replace entity @s container.0 with minecraft:air

execute if data entity @s item.components."minecraft:custom_data".simpledrawer{upgrade:"wood"} at @s as @e[tag=simpledrawer.new_drawer.part.upgrade_display,limit=1,predicate=simpledrawer:impl/search_id_new_drawer,distance=..10] run item replace entity @s container.0 with minecraft:air
execute if data entity @s item.components."minecraft:custom_data".simpledrawer{upgrade:"iron"} at @s as @e[tag=simpledrawer.new_drawer.part.upgrade_display,limit=1,predicate=simpledrawer:impl/search_id_new_drawer,distance=..10] run loot replace entity @s container.0 loot simpledrawer:impl/items/iron_upgrade
execute if data entity @s item.components."minecraft:custom_data".simpledrawer{upgrade:"gold"} at @s as @e[tag=simpledrawer.new_drawer.part.upgrade_display,limit=1,predicate=simpledrawer:impl/search_id_new_drawer,distance=..10] run loot replace entity @s container.0 loot simpledrawer:impl/items/gold_upgrade
execute if data entity @s item.components."minecraft:custom_data".simpledrawer{upgrade:"diamond"} at @s as @e[tag=simpledrawer.new_drawer.part.upgrade_display,limit=1,predicate=simpledrawer:impl/search_id_new_drawer,distance=..10] run loot replace entity @s container.0 loot simpledrawer:impl/items/diamond_upgrade
execute if data entity @s item.components."minecraft:custom_data".simpledrawer{upgrade:"star"} at @s as @e[tag=simpledrawer.new_drawer.part.upgrade_display,limit=1,predicate=simpledrawer:impl/search_id_new_drawer,distance=..10] run loot replace entity @s container.0 loot simpledrawer:impl/items/star_upgrade
execute if data entity @s item.components."minecraft:custom_data".simpledrawer{upgrade:"netherite"} at @s as @e[tag=simpledrawer.new_drawer.part.upgrade_display,limit=1,predicate=simpledrawer:impl/search_id_new_drawer,distance=..10] run loot replace entity @s container.0 loot simpledrawer:impl/items/netherite_upgrade






