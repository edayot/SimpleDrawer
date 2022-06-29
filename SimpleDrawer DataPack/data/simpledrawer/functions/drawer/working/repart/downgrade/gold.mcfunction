data modify entity @s Item.tag.simpledrawer.type set value "iron"
execute store result score #give simpledrawer.math run loot give @p[tag=simpledrawer.adder] loot simpledrawer:items/gold_upgrade
execute if score #give simpledrawer.math matches 0 at @s run loot spawn ~ ~ ~ loot simpledrawer:items/gold_upgrade