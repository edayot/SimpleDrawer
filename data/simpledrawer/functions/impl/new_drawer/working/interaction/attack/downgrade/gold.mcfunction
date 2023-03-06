scoreboard players set #upgrade_success simpledrawer.math 1
loot give @p[tag=simpledrawer.attacker] loot simpledrawer:items/gold_upgrade


data modify entity @s item.tag.simpledrawer.upgrade set value "iron"
data modify entity @s item.tag.simpledrawer.maxCount set from storage simpledrawer:main drawer_type.iron.maxCount
function simpledrawer:impl/new_drawer/base_display
