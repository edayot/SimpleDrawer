tag @s add simpledrawer.drawer.filled
#Copy item, nbt
data remove storage simpledrawer:main temp.ItemDisplay
data modify storage simpledrawer:main temp.ItemDisplay.id set from storage simpledrawer:main temp.input_no_slot.id
data modify storage simpledrawer:main temp.ItemDisplay.Count set value 1b
data modify storage simpledrawer:main temp.ItemDisplay.Damage set from storage simpledrawer:main temp.input_no_slot.Damage
data modify storage simpledrawer:main temp.ItemDisplay.tag.CustomModelData set from storage simpledrawer:main temp.input_no_slot.tag.CustomModelData
data modify storage simpledrawer:main temp.ItemDisplay.tag.Enchantments set from storage simpledrawer:main temp.input_no_slot.tag.Enchantments
data modify storage simpledrawer:main temp.ItemDisplay.tag.SkullOwner set from storage simpledrawer:main temp.input_no_slot.tag.SkullOwner
data modify storage simpledrawer:main temp.ItemDisplay.tag.Potion set from storage simpledrawer:main temp.input_no_slot.tag.Potion
data modify storage simpledrawer:main temp.ItemDisplay.tag.StoredEnchantments set from storage simpledrawer:main temp.input_no_slot.tag.StoredEnchantments
data modify storage simpledrawer:main temp.ItemDisplay.tag.Fireworks set from storage simpledrawer:main temp.input_no_slot.tag.Fireworks
data modify storage simpledrawer:main temp.ItemDisplay.tag.Explosion set from storage simpledrawer:main temp.input_no_slot.tag.Explosion

data modify entity @s Item set from storage simpledrawer:main temp.ItemDisplay
data modify entity @s Item.tag.simpledrawer set from storage simpledrawer:main temp.ItemDrawer.tag.simpledrawer
data modify entity @s Item.tag.simpledrawer.Item set from storage simpledrawer:main temp.input_no_slot
scoreboard players set @s simpledrawer.drawer.Count 0
execute store result score @s simpledrawer.drawer.Count run data get storage simpledrawer:main temp.input_no_slot.Count


#IO compatibility
data modify storage simpledrawer:io output set from storage simpledrawer:io input
data modify storage simpledrawer:io output.Count set value 0b

execute if score @s simpledrawer.drawer.Count > @s simpledrawer.drawer.maxCount store result storage simpledrawer:io output.Count int 1 run scoreboard players get @s simpledrawer.drawer.maxCount
execute if score @s simpledrawer.drawer.Count > @s simpledrawer.drawer.maxCount run scoreboard players operation @s simpledrawer.drawer.Count = @s simpledrawer.drawer.maxCount


function simpledrawer:drawer/working/display/count





scoreboard players set #success simpledrawer.io 1
scoreboard players set #count_output simpledrawer.io 0
scoreboard players operation #count_insert simpledrawer.io = @s simpledrawer.drawer.Count
