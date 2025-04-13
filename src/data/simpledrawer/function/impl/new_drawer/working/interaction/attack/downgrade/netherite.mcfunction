scoreboard players set #upgrade_success simpledrawer.math 1
loot give @p[tag=simpledrawer.attacker] loot simpledrawer:impl/items/netherite_upgrade


data modify entity @s item.components."minecraft:custom_data".simpledrawer.upgrade set value "star"
data modify entity @s item.components."minecraft:custom_data".simpledrawer.maxCount set from storage simpledrawer:main drawer_type.star.maxCount
function simpledrawer:impl/new_drawer/base_display
