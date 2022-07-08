scoreboard players set #already simpledrawer.math 1
data modify storage simpledrawer:main temp.ItemPlayer set from entity @s Inventory
data remove storage simpledrawer:main temp.ItemPlayer[{Slot:100b}]
data remove storage simpledrawer:main temp.ItemPlayer[{Slot:101b}]
data remove storage simpledrawer:main temp.ItemPlayer[{Slot:102b}]
data remove storage simpledrawer:main temp.ItemPlayer[{Slot:103b}]
data remove storage simpledrawer:main temp.ItemPlayer[{Slot:-106b}]

scoreboard players set #nb_empty_slot simpledrawer.math 36
execute store result score #nb_filled_slot simpledrawer.math if data storage simpledrawer:main temp.ItemPlayer[]

scoreboard players operation #nb_empty_slot simpledrawer.math -= #nb_filled_slot simpledrawer.math


execute as @e[tag=simpledrawer.selected,limit=1,tag=simpledrawer.drawer.filled] run function simpledrawer:drawer/working/repart/big_unfill_2
