#Test SelectedItem == Drawer Item

data remove storage simpledrawertemp ItemDrawer

data modify storage simpledrawertemp ItemDrawer set from entity @s Item.tag.data
data remove storage simpledrawertemp ItemAdded.Count
data remove storage simpledrawertemp ItemDrawer.Count
data remove storage simpledrawertemp ItemDrawer.Slot

#tellraw @a {"nbt":"ItemAdded","storage":"simpledrawertemp"}
#tellraw @a {"nbt":"ItemDrawer","storage":"simpledrawertemp"}

execute store success score same SD_tempC run data modify storage simpledrawertemp ItemAdded set from storage simpledrawertemp ItemDrawer

#if same

execute if score same SD_tempC matches 0 if score @p[tag=SD_adder] SD_sneak matches 0 run function simpledrawerworking/fill/fill

#execute if score same SD_tempC matches 0 if score @p[tag=SD_adder] SD_sneak matches 1.. run function simpledrawerworking/fill/bigfill/bigfill

execute if score same SD_tempC matches 1 if score @p[tag=SD_adder] SD_sneak matches 1.. run function simpledrawerworking/upgrade/test

#reset
data modify entity @s ItemRotation set value 0b
