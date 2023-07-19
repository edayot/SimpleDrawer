scoreboard players set #upgrade_success simpledrawer.math 1
advancement grant @p[tag=simpledrawer.attacker] only simpledrawer:display/upgrade/netherite
item modify entity @p[tag=simpledrawer.attacker,gamemode=!creative] weapon.mainhand simpledrawer:impl/remove_1

data modify entity @s item.tag.simpledrawer.upgrade set value "netherite"
data modify entity @s item.tag.simpledrawer.maxCount set from storage simpledrawer:main drawer_type.netherite.maxCount
function simpledrawer:impl/new_drawer/base_display



