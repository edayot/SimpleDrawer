scoreboard players set #upgrade_success simpledrawer.math 1
advancement grant @p[tag=simpledrawer.attacker] only simpledrawer:display/upgrade/hopper
item modify entity @p[tag=simpledrawer.attacker,gamemode=!creative] weapon.mainhand simpledrawer:remove_1

data modify entity @s item.tag.simpledrawer.hopper set value 1b
tag @s add simpledrawer.new_drawer.hopper
tag @s add itemio.container.hopper

function simpledrawer:impl/new_drawer/base_display



