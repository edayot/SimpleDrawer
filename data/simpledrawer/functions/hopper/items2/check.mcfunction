#same as testfill.mcfunction
#say check2
data remove storage simpledrawer:temp ItemDrawer
data remove storage simpledrawer:temp ItemHopper

data modify storage simpledrawer:temp ItemDrawer set from entity @e[type=glow_item_frame,tag=SD_selected,limit=1] Item.tag.data
data modify storage simpledrawer:temp ItemHopper set from block ~ ~ ~ Items[{Slot:2b}]
data remove storage simpledrawer:temp ItemDrawer.Count
data remove storage simpledrawer:temp ItemDrawer.Slot
data remove storage simpledrawer:temp ItemHopper.Count
data remove storage simpledrawer:temp ItemHopper.Slot

execute store success score same SD_tempC run data modify storage simpledrawer:temp ItemDrawer set from storage simpledrawer:temp ItemHopper
execute if score same SD_tempC matches 0 run function simpledrawer:hopper_extract/items2/extract