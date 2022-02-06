data remove storage simpledrawer:temp ItemDrawer
data remove storage simpledrawer:temp ItemHopper

data modify storage simpledrawer:temp ItemDrawer set from entity @e[type=glow_item_frame,tag=simpledrawer.selected,limit=1] Item.tag.data
data modify storage simpledrawer:temp ItemHopper set from block ~ ~2 ~ Items[{Slot:1b}]

data remove storage simpledrawer:temp ItemDrawer.Count
data remove storage simpledrawer:temp ItemDrawer.Slot
data remove storage simpledrawer:temp ItemHopper.Count
data remove storage simpledrawer:temp ItemHopper.Slot



execute store success score same simpledrawer.tempC run data modify storage simpledrawer:temp ItemDrawer set from storage simpledrawer:temp ItemHopper
execute if score same simpledrawer.tempC matches 0 run function simpledrawer:hopper_insert/items1/insert