scoreboard players set #upgrade_success simpledrawer.math 1
loot give @p[tag=simpledrawer.attacker] loot simpledrawer:items/diamond_upgrade


data modify entity @s item.tag.simpledrawer.upgrade set value "gold"
data modify entity @s item.tag.simpledrawer.maxCount set from storage simpledrawer:main drawer_type.gold.maxCount
function simpledrawer:impl/new_drawer/base_display
