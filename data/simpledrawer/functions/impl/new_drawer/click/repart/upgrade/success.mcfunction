
scoreboard players set #already simpledrawer.math 1

function simpledrawer:impl/new_drawer/working/set_maxcount

execute at @s run playsound minecraft:entity.experience_orb.pickup block @a ~ ~ ~ 1 1
item modify entity @p[gamemode=!creative,tag=simpledrawer.adder] weapon.mainhand simpledrawer:remove_1
