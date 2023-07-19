data modify entity @s Item.tag.simpledrawer.type set value "diamond"
execute store result score #give simpledrawer.math run loot give @p[tag=simpledrawer.adder] loot simpledrawer:impl/items/star_upgrade
execute if score #give simpledrawer.math matches 0 at @s run loot spawn ~ ~ ~ loot simpledrawer:impl/items/star_upgrade