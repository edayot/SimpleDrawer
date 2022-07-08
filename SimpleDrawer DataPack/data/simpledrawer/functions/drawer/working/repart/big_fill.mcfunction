

data modify storage simpledrawer:main temp.ItemPlayer set from entity @s Inventory
data remove storage simpledrawer:main temp.ItemPlayer[{Slot:100b}]
data remove storage simpledrawer:main temp.ItemPlayer[{Slot:101b}]
data remove storage simpledrawer:main temp.ItemPlayer[{Slot:102b}]
data remove storage simpledrawer:main temp.ItemPlayer[{Slot:103b}]
data remove storage simpledrawer:main temp.ItemPlayer[{Slot:-106b}]

#All 36 slot

execute as @e[tag=simpledrawer.selected,limit=1] run function simpledrawer:drawer/working/repart/big_fill_2



