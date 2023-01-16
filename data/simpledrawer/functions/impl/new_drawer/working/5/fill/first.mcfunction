
#Copy item, nbt
data modify entity @s Item.tag.simpledrawer.Item5 set from storage simpledrawer:main temp.input_no_slot
scoreboard players set @s simpledrawer.drawer.Count5 0
execute store result score @s simpledrawer.drawer.Count5 run data get storage simpledrawer:main temp.input_no_slot.Count


#IO compatibility
data modify storage simpledrawer:io output set from storage simpledrawer:io input
data modify storage simpledrawer:io output.Count set value 0b

execute if score @s simpledrawer.drawer.Count5 > @s simpledrawer.drawer.maxCount5 store result storage simpledrawer:io output.Count int 1 run scoreboard players get @s simpledrawer.drawer.maxCount5
execute if score @s simpledrawer.drawer.Count5 > @s simpledrawer.drawer.maxCount5 run scoreboard players operation @s simpledrawer.drawer.Count5 = @s simpledrawer.drawer.maxCount5


#Update display ##TODO




scoreboard players set #success simpledrawer.io 1
scoreboard players set #count_output simpledrawer.io 0
scoreboard players operation #count_insert simpledrawer.io = @s simpledrawer.drawer.Count5

        