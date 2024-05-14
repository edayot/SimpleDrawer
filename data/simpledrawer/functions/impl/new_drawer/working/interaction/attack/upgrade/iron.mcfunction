scoreboard players set #upgrade_success simpledrawer.math 1
advancement grant @p[tag=simpledrawer.attacker] only simpledrawer:display/upgrade/iron
item modify entity @p[tag=simpledrawer.attacker,gamemode=!creative] weapon.mainhand simpledrawer:impl/remove_1

data modify entity @s item.components."minecraft:custom_data".simpledrawer.upgrade set value "iron"
data modify entity @s item.components."minecraft:custom_data".simpledrawer.maxCount set from storage simpledrawer:main drawer_type.iron.maxCount
function simpledrawer:impl/new_drawer/base_display



