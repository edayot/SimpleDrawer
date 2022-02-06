
#add @s asItems if player as item
data remove storage simpledrawer:temp ItemAdded
execute at @s run data modify storage simpledrawer:temp ItemAdded set from entity @p[tag=simpledrawer.adder] SelectedItem
execute if data storage simpledrawer:temp ItemAdded run tag @s add simpledrawer.asItems


execute if entity @s[tag=simpledrawer.asItems] run function simpledrawer:working/click/as_items
execute unless entity @s[tag=simpledrawer.asItems] run function simpledrawer:working/click/no_items


data modify entity @s ItemRotation set value 0b
tag @a remove simpledrawer.adder
tag @s remove simpledrawer.asItems