data modify entity @s Item.tag.simpledrawer.hopper set value 0b
tag @s remove itemio.container.hopper
execute store result score #give simpledrawer.math run loot give @p[tag=simpledrawer.adder] loot simpledrawer:items/hopper_upgrade
execute if score #give simpledrawer.math matches 0 at @s run loot spawn ~ ~ ~ loot simpledrawer:items/hopper_upgrade