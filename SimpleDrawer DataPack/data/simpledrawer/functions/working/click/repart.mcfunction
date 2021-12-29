
#add @s asItems if player as item
data remove storage simpledrawer:temp ItemAdded
execute at @s run data modify storage simpledrawer:temp ItemAdded set from entity @p[tag=SD_adder] SelectedItem
execute if data storage simpledrawer:temp ItemAdded run tag @s add SD_asItems


execute if entity @s[tag=SD_asItems] run function simpledrawer:working/click/as_items
execute unless entity @s[tag=SD_asItems] run function simpledrawer:working/click/no_items


data modify entity @s ItemRotation set value 0b
tag @a remove SD_adder
tag @s remove SD_asItems