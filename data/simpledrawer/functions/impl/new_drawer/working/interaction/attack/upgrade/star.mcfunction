scoreboard players set #upgrade_success simpledrawer.math 1
advancement grant @p[tag=simpledrawer.attacker] only simpledrawer:display/upgrade/star
item modify entity @p[tag=simpledrawer.attacker,gamemode=!creative] weapon.mainhand simpledrawer:remove_1

data modify entity @s item.tag.simpledrawer.upgrade set value "star"
data modify entity @s item.tag.simpledrawer.maxCount set from storage simpledrawer:main drawer_type.star.maxCount
function simpledrawer:impl/new_drawer/base_display



