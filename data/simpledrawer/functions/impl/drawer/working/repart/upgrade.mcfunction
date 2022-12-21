
execute as @e[tag=simpledrawer.selected] run function simpledrawer:impl/drawer/working/repart/upgrade_2
execute if score #upgrade_success simpledrawer.math matches 1 run item modify entity @s[gamemode=!creative] weapon.mainhand simpledrawer:remove_1
