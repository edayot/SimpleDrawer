scoreboard players set #upgrade_success simpledrawer.math 1
advancement grant @p[tag=simpledrawer.attacker] only simpledrawer:display/upgrade/diamond
item modify entity @p[tag=simpledrawer.attacker,gamemode=!creative] weapon.mainhand simpledrawer:remove_1

data modify entity @s item.tag.simpledrawer.upgrade set value "diamond"
data modify entity @s item.tag.simpledrawer.maxCount set from storage simpledrawer:main drawer_type.diamond.maxCount
function simpledrawer:impl/new_drawer/base_display


