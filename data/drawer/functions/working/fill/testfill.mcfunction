#Test SelectedItem == Drawer Item

data remove storage drawer:temp ItemDrawer

data modify storage drawer:temp ItemDrawer set from entity @s Item.tag.data
data remove storage drawer:temp ItemAdded.Count
data remove storage drawer:temp ItemDrawer.Count
data remove storage drawer:temp ItemDrawer.Slot

#tellraw @a {"nbt":"ItemAdded","storage":"drawer:temp"}
#tellraw @a {"nbt":"ItemDrawer","storage":"drawer:temp"}

execute store success score same SD_tempC run data modify storage drawer:temp ItemAdded set from storage drawer:temp ItemDrawer

#if same

execute if score same SD_tempC matches 0 if score @p[tag=SD_adder] SD_sneak matches 0 run function drawer:working/fill/fill

#execute if score same SD_tempC matches 0 if score @p[tag=SD_adder] SD_sneak matches 1.. run function drawer:working/fill/bigfill/bigfill

execute if score same SD_tempC matches 1 if score @p[tag=SD_adder] SD_sneak matches 1.. run function drawer:working/upgrade/test

#reset
data modify entity @s ItemRotation set value 0b
