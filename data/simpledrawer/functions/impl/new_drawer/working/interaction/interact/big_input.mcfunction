


data modify storage simpledrawer:main temp.Inventory set from entity @p[tag=simpledrawer.interacter] Inventory
data remove storage simpledrawer:main temp.Inventory[{Slot:100b}]
data remove storage simpledrawer:main temp.Inventory[{Slot:101b}]
data remove storage simpledrawer:main temp.Inventory[{Slot:102b}]
data remove storage simpledrawer:main temp.Inventory[{Slot:103b}]
data remove storage simpledrawer:main temp.Inventory[{Slot:-106b}]


scoreboard players operation #search_id simpledrawer.math = @s simpledrawer.new_drawer.id
scoreboard players operation #slot simpledrawer.io = @s simpledrawer.new_drawer.part_id

execute if data storage simpledrawer:main temp.Inventory[0] as @e[tag=simpledrawer.new_drawer.part.base,predicate=simpledrawer:impl/search_id_new_drawer,predicate=simpledrawer:impl/test_version] run function simpledrawer:impl/new_drawer/working/interaction/interact/big_input_2
