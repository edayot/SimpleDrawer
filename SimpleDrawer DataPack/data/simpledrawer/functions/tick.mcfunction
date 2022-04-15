#Hopper compatibility 


# rename from previous tag on destroy


#Place and destroy






#Test click

#execute as @e[type=glow_item_frame,tag=simpledrawer.DrawerItem,tag=!simpledrawer.filled] unless data entity @s {ItemRotation:0b} run function simpledrawer:working/fill/firstfilltest
#execute as @e[type=glow_item_frame,tag=simpledrawer.DrawerItem,tag=simpledrawer.filled] unless data entity @s {ItemRotation:0b} run function simpledrawer:working/testclick



#scoreboard players reset * simpledrawer.tempC
scoreboard players set @a simpledrawer.sneak 0
#execute as @e[type=glow_item_frame,tag=SD_DrawerBlock] at @s unless block ~ ~ ~ minecraft:beehive run function simpledrawer:working/rename_tag
execute as @e[type=item,predicate=simpledrawer:is_drawer] at @s run function simpledrawer:destroy/fast_destroy

#Different ticks
execute as @e[type=glow_item_frame,tag=simpledrawer.DrawerBlock] run function simpledrawer:tick_drawerblock
execute as @e[type=glow_item_frame,tag=simpledrawer.DrawerItem] run function simpledrawer:tick_draweritem



schedule function simpledrawer:tick 1t



