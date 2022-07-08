tag @s add simpledrawer.drawer.item.me
execute if entity @a[tag=simpledrawer.adder,predicate=simpledrawer:is_looking_me,distance=..7] unless entity @e[tag=simpledrawer.selected] run tag @s add simpledrawer.selected
tag @s remove simpledrawer.drawer.item.me