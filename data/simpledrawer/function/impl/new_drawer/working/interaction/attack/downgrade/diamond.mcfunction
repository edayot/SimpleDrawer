scoreboard players set #upgrade_success simpledrawer.math 1
loot give @p[tag=simpledrawer.attacker] loot simpledrawer:impl/items/diamond_upgrade


data modify entity @s item.components."minecraft:custom_data".simpledrawer.upgrade set value "gold"
data modify entity @s item.components."minecraft:custom_data".simpledrawer.maxCount set from storage simpledrawer:main drawer_type.gold.maxCount
function simpledrawer:impl/new_drawer/base_display
