scoreboard players set #upgrade_success simpledrawer.math 1
loot give @p[tag=simpledrawer.attacker] loot simpledrawer:items/netherite_upgrade


data modify entity @s item.tag.simpledrawer.upgrade set value "star"
data modify entity @s item.tag.simpledrawer.maxCount set from storage simpledrawer:main drawer_type.star.maxCount
function simpledrawer:impl/new_drawer/base_display
