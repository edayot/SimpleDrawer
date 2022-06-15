

data modify storage simpledrawer:main temp.ItemPlayer set from entity @s Inventory
data remove storage simpledrawer:main temp.ItemPlayer[{Slot:100b}]
data remove storage simpledrawer:main temp.ItemPlayer[{Slot:101b}]
data remove storage simpledrawer:main temp.ItemPlayer[{Slot:102b}]
data remove storage simpledrawer:main temp.ItemPlayer[{Slot:103b}]
data remove storage simpledrawer:main temp.ItemPlayer[{Slot:-106b}]


#All 36 slot
tag @s add simpledrawer.adder
execute if data storage simpledrawer:main temp.ItemPlayer[{Slot:0b}] as @e[tag=simpledrawer.selected,limit=1] run function simpledrawer:drawer/working/repart/big_fill/0
execute if data storage simpledrawer:main temp.ItemPlayer[{Slot:1b}] as @e[tag=simpledrawer.selected,limit=1] run function simpledrawer:drawer/working/repart/big_fill/1
execute if data storage simpledrawer:main temp.ItemPlayer[{Slot:2b}] as @e[tag=simpledrawer.selected,limit=1] run function simpledrawer:drawer/working/repart/big_fill/2
execute if data storage simpledrawer:main temp.ItemPlayer[{Slot:3b}] as @e[tag=simpledrawer.selected,limit=1] run function simpledrawer:drawer/working/repart/big_fill/3
execute if data storage simpledrawer:main temp.ItemPlayer[{Slot:4b}] as @e[tag=simpledrawer.selected,limit=1] run function simpledrawer:drawer/working/repart/big_fill/4
execute if data storage simpledrawer:main temp.ItemPlayer[{Slot:5b}] as @e[tag=simpledrawer.selected,limit=1] run function simpledrawer:drawer/working/repart/big_fill/5
execute if data storage simpledrawer:main temp.ItemPlayer[{Slot:6b}] as @e[tag=simpledrawer.selected,limit=1] run function simpledrawer:drawer/working/repart/big_fill/6
execute if data storage simpledrawer:main temp.ItemPlayer[{Slot:7b}] as @e[tag=simpledrawer.selected,limit=1] run function simpledrawer:drawer/working/repart/big_fill/7
execute if data storage simpledrawer:main temp.ItemPlayer[{Slot:8b}] as @e[tag=simpledrawer.selected,limit=1] run function simpledrawer:drawer/working/repart/big_fill/8
execute if data storage simpledrawer:main temp.ItemPlayer[{Slot:9b}] as @e[tag=simpledrawer.selected,limit=1] run function simpledrawer:drawer/working/repart/big_fill/9
execute if data storage simpledrawer:main temp.ItemPlayer[{Slot:10b}] as @e[tag=simpledrawer.selected,limit=1] run function simpledrawer:drawer/working/repart/big_fill/10
execute if data storage simpledrawer:main temp.ItemPlayer[{Slot:11b}] as @e[tag=simpledrawer.selected,limit=1] run function simpledrawer:drawer/working/repart/big_fill/11
execute if data storage simpledrawer:main temp.ItemPlayer[{Slot:12b}] as @e[tag=simpledrawer.selected,limit=1] run function simpledrawer:drawer/working/repart/big_fill/12
execute if data storage simpledrawer:main temp.ItemPlayer[{Slot:13b}] as @e[tag=simpledrawer.selected,limit=1] run function simpledrawer:drawer/working/repart/big_fill/13
execute if data storage simpledrawer:main temp.ItemPlayer[{Slot:14b}] as @e[tag=simpledrawer.selected,limit=1] run function simpledrawer:drawer/working/repart/big_fill/14
execute if data storage simpledrawer:main temp.ItemPlayer[{Slot:15b}] as @e[tag=simpledrawer.selected,limit=1] run function simpledrawer:drawer/working/repart/big_fill/15
execute if data storage simpledrawer:main temp.ItemPlayer[{Slot:16b}] as @e[tag=simpledrawer.selected,limit=1] run function simpledrawer:drawer/working/repart/big_fill/16
execute if data storage simpledrawer:main temp.ItemPlayer[{Slot:17b}] as @e[tag=simpledrawer.selected,limit=1] run function simpledrawer:drawer/working/repart/big_fill/17
execute if data storage simpledrawer:main temp.ItemPlayer[{Slot:18b}] as @e[tag=simpledrawer.selected,limit=1] run function simpledrawer:drawer/working/repart/big_fill/18
execute if data storage simpledrawer:main temp.ItemPlayer[{Slot:19b}] as @e[tag=simpledrawer.selected,limit=1] run function simpledrawer:drawer/working/repart/big_fill/19
execute if data storage simpledrawer:main temp.ItemPlayer[{Slot:20b}] as @e[tag=simpledrawer.selected,limit=1] run function simpledrawer:drawer/working/repart/big_fill/20
execute if data storage simpledrawer:main temp.ItemPlayer[{Slot:21b}] as @e[tag=simpledrawer.selected,limit=1] run function simpledrawer:drawer/working/repart/big_fill/21
execute if data storage simpledrawer:main temp.ItemPlayer[{Slot:22b}] as @e[tag=simpledrawer.selected,limit=1] run function simpledrawer:drawer/working/repart/big_fill/22
execute if data storage simpledrawer:main temp.ItemPlayer[{Slot:23b}] as @e[tag=simpledrawer.selected,limit=1] run function simpledrawer:drawer/working/repart/big_fill/23
execute if data storage simpledrawer:main temp.ItemPlayer[{Slot:24b}] as @e[tag=simpledrawer.selected,limit=1] run function simpledrawer:drawer/working/repart/big_fill/24
execute if data storage simpledrawer:main temp.ItemPlayer[{Slot:25b}] as @e[tag=simpledrawer.selected,limit=1] run function simpledrawer:drawer/working/repart/big_fill/25
execute if data storage simpledrawer:main temp.ItemPlayer[{Slot:26b}] as @e[tag=simpledrawer.selected,limit=1] run function simpledrawer:drawer/working/repart/big_fill/26
execute if data storage simpledrawer:main temp.ItemPlayer[{Slot:27b}] as @e[tag=simpledrawer.selected,limit=1] run function simpledrawer:drawer/working/repart/big_fill/27
execute if data storage simpledrawer:main temp.ItemPlayer[{Slot:28b}] as @e[tag=simpledrawer.selected,limit=1] run function simpledrawer:drawer/working/repart/big_fill/28
execute if data storage simpledrawer:main temp.ItemPlayer[{Slot:29b}] as @e[tag=simpledrawer.selected,limit=1] run function simpledrawer:drawer/working/repart/big_fill/29
execute if data storage simpledrawer:main temp.ItemPlayer[{Slot:30b}] as @e[tag=simpledrawer.selected,limit=1] run function simpledrawer:drawer/working/repart/big_fill/30
execute if data storage simpledrawer:main temp.ItemPlayer[{Slot:31b}] as @e[tag=simpledrawer.selected,limit=1] run function simpledrawer:drawer/working/repart/big_fill/31
execute if data storage simpledrawer:main temp.ItemPlayer[{Slot:32b}] as @e[tag=simpledrawer.selected,limit=1] run function simpledrawer:drawer/working/repart/big_fill/32
execute if data storage simpledrawer:main temp.ItemPlayer[{Slot:33b}] as @e[tag=simpledrawer.selected,limit=1] run function simpledrawer:drawer/working/repart/big_fill/33
execute if data storage simpledrawer:main temp.ItemPlayer[{Slot:34b}] as @e[tag=simpledrawer.selected,limit=1] run function simpledrawer:drawer/working/repart/big_fill/34
execute if data storage simpledrawer:main temp.ItemPlayer[{Slot:35b}] as @e[tag=simpledrawer.selected,limit=1] run function simpledrawer:drawer/working/repart/big_fill/35

tag @s remove simpledrawer.adder
