
data modify storage simpledrawer:main temp.ItemTry set from storage simpledrawer:main temp.ItemsHopper[{Slot:1b}]

data modify storage simpledrawer:main temp.ItemTry.Count set from storage simpledrawer:main temp.ItemDrawer.Count
data remove storage simpledrawer:main temp.ItemTry.Slot

execute store success score #!same simpledrawer.math run data modify storage simpledrawer:main temp.ItemTry set from storage simpledrawer:main temp.ItemDrawer
execute if score #!same simpledrawer.math matches 0 run function simpledrawer:drawer/working/minecart_hopper_extract/slot1/insert
