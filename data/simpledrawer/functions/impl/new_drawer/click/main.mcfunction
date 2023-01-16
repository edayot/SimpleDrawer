

data modify storage simpledrawer:main temp.test set value []
data modify storage simpledrawer:main temp.test append from entity @s Inventory[{tag:{simpledrawer:{drawer_book:1b}}}]
clear @s book{simpledrawer:{drawer_book:1b}}
execute store result score #test_id simpledrawer.math run data get storage simpledrawer:main temp.test[0].tag.simpledrawer.drawer_id


execute as @e[tag=simpledrawer.new_drawer] if score @s simpledrawer.id = #test_id simpledrawer.math run tag @s add simpledrawer.selected

execute as @e[tag=simpledrawer.selected,limit=1] at @s run function simpledrawer:impl/new_drawer/regen_books



