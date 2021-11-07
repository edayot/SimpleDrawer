data remove storage drawer:temp ItemDrawer
data remove storage drawer:temp ItemHopper

data modify storage drawer:temp ItemDrawer set from entity @e[type=glow_item_frame,tag=SD_selected,limit=1] Item.tag.data
data modify storage drawer:temp ItemHopper set from block ~ ~2 ~ Items[{Slot:2b}]

data remove storage drawer:temp ItemDrawer.Count
data remove storage drawer:temp ItemDrawer.Slot
data remove storage drawer:temp ItemHopper.Count
data remove storage drawer:temp ItemHopper.Slot



execute store success score same SD_tempC run data modify storage drawer:temp ItemDrawer set from storage drawer:temp ItemHopper
execute if score same SD_tempC matches 0 run function drawer:hopper_insert/items2/insert