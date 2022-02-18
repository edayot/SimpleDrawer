#Hopper compatibility 


# rename from previous tag on destroy


#Place and destroy






#Test click

#execute as @e[type=glow_item_frame,tag=simpledrawer.DrawerItem,tag=!simpledrawer.filled] unless data entity @s {ItemRotation:0b} run function simpledrawer:working/fill/firstfilltest
#execute as @e[type=glow_item_frame,tag=simpledrawer.DrawerItem,tag=simpledrawer.filled] unless data entity @s {ItemRotation:0b} run function simpledrawer:working/testclick


execute as @a[tag=!simpledrawer.book] at @s run function simpledrawer:crafts/guide_craft
tag @a add simpledrawer.book

#scoreboard players reset * simpledrawer.tempC
scoreboard players set @a simpledrawer.sneak 0
#execute as @e[type=glow_item_frame,tag=SD_DrawerBlock] at @s unless block ~ ~ ~ minecraft:beehive run function simpledrawer:working/rename_tag
execute as @e[type=item] if data entity @s {Item:{tag:{Drawer:1b}}} at @s run function simpledrawer:destroy/fast_destroy

#Different ticks
execute as @e[type=glow_item_frame,tag=simpledrawer.DrawerBlock] run function simpledrawer:tick_drawerblock
execute as @e[type=glow_item_frame,tag=simpledrawer.DrawerItem] run function simpledrawer:tick_draweritem






