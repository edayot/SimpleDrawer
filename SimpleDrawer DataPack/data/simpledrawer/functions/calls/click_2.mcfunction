data remove storage simpledrawer:main temp.ItemInput
data modify storage simpledrawer:main temp.ItemInput set from entity @s SelectedItem

scoreboard players set #already simpledrawer.math 0

tag @e[type=glow_item_frame,sort=nearest,predicate=!simpledrawer:not_rotated,distance=..7,tag=simpledrawer.drawer.item,limit=1] add simpledrawer.selected


scoreboard players set #exist simpledrawer.math 0
scoreboard players set #exist_filled simpledrawer.math 0
scoreboard players set #filled_hand simpledrawer.math 0
scoreboard players set #sneaking simpledrawer.math 0

execute store success score #exist simpledrawer.math if entity @e[tag=simpledrawer.selected]
execute store success score #exist_filled simpledrawer.math if entity @e[tag=simpledrawer.selected,tag=simpledrawer.drawer.filled]
execute store success score #filled_hand simpledrawer.math if data storage simpledrawer:main temp.ItemInput
execute store success score #sneaking simpledrawer.math if entity @s[predicate=simpledrawer:sneaking]

#Upgrade and downgrade system
execute if score #already simpledrawer.math matches 0 if score #exist simpledrawer.math matches 1 if score #sneaking simpledrawer.math matches 1 if data storage simpledrawer:main temp.ItemInput.tag.simpledrawer.downgrade run function simpledrawer:drawer/working/repart/downgrade

execute if score #already simpledrawer.math matches 0 if score #exist simpledrawer.math matches 1 if score #sneaking simpledrawer.math matches 1 if data storage simpledrawer:main temp.ItemInput.tag.simpledrawer.upgrade run function simpledrawer:drawer/working/repart/upgrade


#First checks fill unfill, bigfill and bigunfill
execute if score #already simpledrawer.math matches 0 if score #exist simpledrawer.math matches 1 if score #filled_hand simpledrawer.math matches 1 if score #sneaking simpledrawer.math matches 0 run function simpledrawer:drawer/working/repart/simple_fill

execute if score #already simpledrawer.math matches 0 if score #exist_filled simpledrawer.math matches 1 if score #filled_hand simpledrawer.math matches 0 if score #sneaking simpledrawer.math matches 0 run function simpledrawer:drawer/working/repart/simple_unfill

execute if score #already simpledrawer.math matches 0 if score #exist_filled simpledrawer.math matches 1 if score #filled_hand simpledrawer.math matches 0 if score #sneaking simpledrawer.math matches 1 run function simpledrawer:drawer/working/repart/big_unfill

execute if score #already simpledrawer.math matches 0 if score #exist_filled simpledrawer.math matches 1 if score #filled_hand simpledrawer.math matches 1 if score #sneaking simpledrawer.math matches 1 run function simpledrawer:drawer/working/repart/big_fill

#Secondary fill
execute if score #already simpledrawer.math matches 0 if score #exist simpledrawer.math matches 1 if score #filled_hand simpledrawer.math matches 1 if score #sneaking simpledrawer.math matches 1 run function simpledrawer:drawer/working/repart/simple_fill

#U
data modify entity @e[tag=simpledrawer.selected,limit=1] ItemRotation set value 0b
tag @e[tag=simpledrawer.selected] remove simpledrawer.selected