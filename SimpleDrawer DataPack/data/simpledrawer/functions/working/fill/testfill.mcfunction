#Test SelectedItem == Drawer Item

data remove storage simpledrawer:temp ItemDrawer

data modify storage simpledrawer:temp ItemDrawer set from entity @s Item.tag.data
data remove storage simpledrawer:temp ItemAdded.Count
data remove storage simpledrawer:temp ItemDrawer.Count
data remove storage simpledrawer:temp ItemDrawer.Slot

#tellraw @a {"nbt":"ItemAdded","storage":"simpledrawer:temp"}
#tellraw @a {"nbt":"ItemDrawer","storage":"simpledrawer:temp"}

execute store success score same SD_tempC run data modify storage simpledrawer:temp ItemAdded set from storage simpledrawer:temp ItemDrawer

#if same

execute if score same SD_tempC matches 0 run function simpledrawer:working/fill/fill

#execute if score same SD_tempC matches 0 if score @p[tag=SD_adder] SD_sneak matches 1.. run function simpledrawer:working/fill/bigfill/bigfill

#execute if score same SD_tempC matches 1 if score @p[tag=SD_adder] SD_sneak matches 1.. run function simpledrawer:working/upgrade/test

#reset
data modify entity @s ItemRotation set value 0b
