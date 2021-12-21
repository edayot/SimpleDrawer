#same as testfill.mcfunction
#say check3
data remove storage simpledrawertemp ItemDrawer
data remove storage simpledrawertemp ItemHopper

data modify storage simpledrawertemp ItemDrawer set from entity @e[type=glow_item_frame,tag=SD_selected,limit=1] Item.tag.data
data modify storage simpledrawertemp ItemHopper set from block ~ ~ ~ Items[{Slot:3b}]
data remove storage simpledrawertemp ItemDrawer.Count
data remove storage simpledrawertemp ItemDrawer.Slot
data remove storage simpledrawertemp ItemHopper.Count
data remove storage simpledrawertemp ItemHopper.Slot

execute store success score same SD_tempC run data modify storage simpledrawertemp ItemDrawer set from storage simpledrawertemp ItemHopper
execute if score same SD_tempC matches 0 run function simpledrawerhopper/items3/extract