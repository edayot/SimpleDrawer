

data modify storage simpledrawer:main temp.test set value []
data modify storage simpledrawer:main temp.test append from entity @s Inventory[{tag:{simpledrawer:{drawer_book:1b}}}]
clear @s book{simpledrawer:{drawer_book:1b}}
execute as @e[type=item,sort=nearest,nbt={Item:{tag:{simpledrawer:{drawer_book:1b}}}}] run function simpledrawer:impl/new_drawer/click/item
execute store result score #test_id simpledrawer.math run data get storage simpledrawer:main temp.test[0].tag.simpledrawer.drawer_id


execute as @e[tag=simpledrawer.new_drawer] if score @s simpledrawer.id = #test_id simpledrawer.math run tag @s add simpledrawer.selected

tag @s add simpledrawer.adder
scoreboard players add @s simpledrawer.nb_click 1
data remove storage simpledrawer:main temp.ItemInput
data modify storage simpledrawer:main temp.ItemInput set from entity @s SelectedItem
execute store success score #filled_hand simpledrawer.math if data storage simpledrawer:main temp.ItemInput

execute as @e[tag=simpledrawer.selected,limit=1] at @s run function simpledrawer:impl/new_drawer/click/new_drawer
tag @s remove simpledrawer.adder
