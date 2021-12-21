data modify storage simpledrawertemp ItemAdded set from entity @p[tag=SD_adder] Inventory[{Slot:0b}]
data remove storage simpledrawertemp ItemAdded.Slot
data remove storage simpledrawertemp ItemAdded.Count

execute store success score same SD_tempC run data modify storage simpledrawertemp ItemAdded set from storage simpledrawertemp ItemDrawer

execute if score same SD_tempC matches 0 run function simpledrawerworking/fill/bigfill/slot0/fill