scoreboard players set #upgrade_success simpledrawer.math 1
loot give @p[tag=simpledrawer.attacker] loot simpledrawer:items/hopper_upgrade


data modify entity @s item.tag.simpledrawer.hopper set value 0b
tag @s remove simpledrawer.new_drawer.hopper
function simpledrawer:impl/new_drawer/base_display
