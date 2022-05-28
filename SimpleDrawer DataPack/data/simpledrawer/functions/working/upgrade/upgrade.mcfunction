
function simpledrawer:working/set_max_count
item modify entity @p[tag=simpledrawer.adder] weapon.mainhand simpledrawer:delete_one
execute at @s run playsound minecraft:entity.experience_orb.pickup neutral @a ~ ~ ~ 1 1
function simpledrawer:working/display
tag @s add simpledrawer.upgrade