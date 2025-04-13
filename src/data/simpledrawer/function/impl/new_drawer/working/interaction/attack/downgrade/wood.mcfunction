scoreboard players set #upgrade_success simpledrawer.math 1
loot give @p[tag=simpledrawer.attacker] loot simpledrawer:impl/items/hopper_upgrade


data modify entity @s item.components."minecraft:custom_data".simpledrawer.hopper set value 0b
tag @s remove simpledrawer.new_drawer.hopper
tag @s remove itemio.container.hopper

function simpledrawer:impl/new_drawer/base_display
