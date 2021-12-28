data modify entity @s Item.tag.info.type set from entity @p[tag=SD_adder] SelectedItem.tag.setType
function simpledrawer:working/set_max_count
item modify entity @p[tag=SD_adder] weapon.mainhand simpledrawer:delete_one
execute at @s run playsound minecraft:entity.experience_orb.pickup neutral @a ~ ~ ~ 1 1
function simpledrawer:working/display
tag @s add SD_upgrade