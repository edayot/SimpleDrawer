scoreboard players set #upgrade_success simpledrawer.math 1
loot give @p[tag=simpledrawer.attacker] loot simpledrawer:impl/items/gold_upgrade


data modify entity @s item.components."minecraft:custom_data".simpledrawer.upgrade set value "iron"
data modify entity @s item.components."minecraft:custom_data".simpledrawer.maxCount set from storage simpledrawer:main drawer_type.iron.maxCount
function simpledrawer:impl/new_drawer/base_display
