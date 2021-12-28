data modify entity @s Item.tag.info.hopper set value 1
item modify entity @p[tag=SD_adder] weapon.mainhand simpledrawer:delete_one
execute at @s run playsound minecraft:entity.experience_orb.pickup neutral @a ~ ~ ~ 1 1

execute at @s if entity @s[tag=SD_north] positioned ~ ~ ~0.5 run tag @e[type=glow_item_frame,tag=SD_DrawerBlock,tag=SD_north,distance=..1,sort=nearest,limit=1] add SD_selected2
execute at @s if entity @s[tag=SD_south] positioned ~ ~ ~-0.5 run tag @e[type=glow_item_frame,tag=SD_DrawerBlock,tag=SD_south,distance=..1,sort=nearest,limit=1] add SD_selected2
execute at @s if entity @s[tag=SD_east] positioned ~-0.5 ~ ~ run tag @e[type=glow_item_frame,tag=SD_DrawerBlock,tag=SD_east,distance=..1,sort=nearest,limit=1] add SD_selected2
execute at @s if entity @s[tag=SD_west] positioned ~0.5 ~ ~ run tag @e[type=glow_item_frame,tag=SD_DrawerBlock,tag=SD_west,distance=..1,sort=nearest,limit=1] add SD_selected2

tag @e[type=glow_item_frame,tag=SD_selected2,limit=1] add SD_hopper

tag @e remove SD_selected2
function simpledrawer:working/display
tag @s add SD_upgrade


