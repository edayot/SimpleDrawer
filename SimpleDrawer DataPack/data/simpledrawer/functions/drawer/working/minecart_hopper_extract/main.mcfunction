data modify storage simpledrawer:main temp.ItemDrawer set from entity @s Item.tag.simpledrawer.Item
data modify storage simpledrawer:main temp.ItemsHopper set from entity @e[tag=simpledrawer.selected_hopper,limit=1] Items

scoreboard players set #already_extract simpledrawer.math 0
execute store success score #good simpledrawer.math if data storage simpledrawer:main temp.ItemsHopper[{Slot:0b}]
execute if score #good simpledrawer.math matches 0 run function simpledrawer:drawer/working/minecart_hopper_extract/slot0/first
execute unless score #good simpledrawer.math matches 0 run function simpledrawer:drawer/working/minecart_hopper_extract/slot0/try_insert



execute if score #already_extract simpledrawer.math matches 0 store success score #good simpledrawer.math if data storage simpledrawer:main temp.ItemsHopper[{Slot:1b}]
execute if score #already_extract simpledrawer.math matches 0 if score #good simpledrawer.math matches 0 run function simpledrawer:drawer/working/minecart_hopper_extract/slot1/first
execute if score #already_extract simpledrawer.math matches 0 unless score #good simpledrawer.math matches 0 run function simpledrawer:drawer/working/minecart_hopper_extract/slot1/try_insert

execute if score #already_extract simpledrawer.math matches 0 store success score #good simpledrawer.math if data storage simpledrawer:main temp.ItemsHopper[{Slot:2b}]
execute if score #already_extract simpledrawer.math matches 0 if score #good simpledrawer.math matches 0 run function simpledrawer:drawer/working/minecart_hopper_extract/slot2/first
execute if score #already_extract simpledrawer.math matches 0 unless score #good simpledrawer.math matches 0 run function simpledrawer:drawer/working/minecart_hopper_extract/slot2/try_insert

execute if score #already_extract simpledrawer.math matches 0 store success score #good simpledrawer.math if data storage simpledrawer:main temp.ItemsHopper[{Slot:3b}]
execute if score #already_extract simpledrawer.math matches 0 if score #good simpledrawer.math matches 0 run function simpledrawer:drawer/working/minecart_hopper_extract/slot3/first
execute if score #already_extract simpledrawer.math matches 0 unless score #good simpledrawer.math matches 0 run function simpledrawer:drawer/working/minecart_hopper_extract/slot3/try_insert

execute if score #already_extract simpledrawer.math matches 0 store success score #good simpledrawer.math if data storage simpledrawer:main temp.ItemsHopper[{Slot:4b}]
execute if score #already_extract simpledrawer.math matches 0 if score #good simpledrawer.math matches 0 run function simpledrawer:drawer/working/minecart_hopper_extract/slot4/first
execute if score #already_extract simpledrawer.math matches 0 unless score #good simpledrawer.math matches 0 run function simpledrawer:drawer/working/minecart_hopper_extract/slot4/try_insert

