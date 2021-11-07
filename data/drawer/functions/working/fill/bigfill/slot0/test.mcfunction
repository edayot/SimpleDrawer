data modify storage drawer:temp ItemAdded set from entity @p[tag=SD_adder] Inventory[{Slot:0b}]
data remove storage drawer:temp ItemAdded.Slot
data remove storage drawer:temp ItemAdded.Count

execute store success score same SD_tempC run data modify storage drawer:temp ItemAdded set from storage drawer:temp ItemDrawer

execute if score same SD_tempC matches 0 run function drawer:working/fill/bigfill/slot0/fill