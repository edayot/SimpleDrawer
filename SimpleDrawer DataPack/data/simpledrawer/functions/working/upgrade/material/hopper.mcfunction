data modify entity @s Item.tag.info.hopper set value 1
item modify entity @p[tag=simpledrawer.adder] weapon.mainhand simpledrawer:delete_one
execute at @s run playsound minecraft:entity.experience_orb.pickup neutral @a ~ ~ ~ 1 1

tag @s add simpledrawer.selected
execute at @s as @e[distance=..1.5,type=minecraft:glow_item_frame,tag=simpledrawer.DrawerBlock] if score @s simpledrawer.drawer_id = @e[type=glow_item_frame,tag=simpledrawer.selected,limit=1] simpledrawer.drawer_id run tag @s add simpledrawer.selected2


#execute at @s if entity @s[tag=simpledrawer.north] positioned ~ ~ ~0.5 run tag @e[type=glow_item_frame,tag=simpledrawer.DrawerBlock,tag=simpledrawer.north,distance=..1,sort=nearest,limit=1] add simpledrawer.selected2
#execute at @s if entity @s[tag=simpledrawer.south] positioned ~ ~ ~-0.5 run tag @e[type=glow_item_frame,tag=simpledrawer.DrawerBlock,tag=simpledrawer.south,distance=..1,sort=nearest,limit=1] add simpledrawer.selected2
#execute at @s if entity @s[tag=simpledrawer.east] positioned ~-0.5 ~ ~ run tag @e[type=glow_item_frame,tag=simpledrawer.DrawerBlock,tag=simpledrawer.east,distance=..1,sort=nearest,limit=1] add simpledrawer.selected2
#execute at @s if entity @s[tag=simpledrawer.west] positioned ~0.5 ~ ~ run tag @e[type=glow_item_frame,tag=simpledrawer.DrawerBlock,tag=simpledrawer.west,distance=..1,sort=nearest,limit=1] add simpledrawer.selected2

tag @e[type=glow_item_frame,tag=simpledrawer.selected2,limit=1] add simpledrawer.hopper

tag @e[type=glow_item_frame,tag=simpledrawer.selected2,limit=1] remove simpledrawer.selected2
tag @s remove simpledrawer.selected

function simpledrawer:working/display

tag @s add simpledrawer.upgrade

