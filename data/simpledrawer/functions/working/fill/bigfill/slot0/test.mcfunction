data modify storage simpledrawer:temp ItemAdded set from entity @p[tag=SD_adder] Inventory[{Slot:0b}]
data remove storage simpledrawer:temp ItemAdded.Slot
data remove storage simpledrawer:temp ItemAdded.Count

execute store success score same SD_tempC run data modify storage simpledrawer:temp ItemAdded set from storage simpledrawer:temp ItemDrawer

execute if score same SD_tempC matches 0 run function simpledrawer:working/fill/bigfill/slot0/fill