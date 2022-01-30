#Hopper compatibility 
scoreboard players add @e[type=glow_item_frame,tag=SD_DrawerBlock,tag=SD_hopper] SD_time 0
execute as @e[type=glow_item_frame,tag=SD_DrawerBlock,tag=SD_hopper,scores={SD_time=1..}] run scoreboard players remove @s SD_time 1


execute as @e[type=glow_item_frame,tag=SD_DrawerBlock,tag=SD_hopper,scores={SD_time=..0}] at @s if block ~ ~1 ~ hopper[facing=down] run scoreboard players set @s SD_time 8
execute as @e[type=glow_item_frame,tag=SD_DrawerBlock,tag=SD_hopper,scores={SD_time=..0}] at @s if block ~ ~-1 ~ hopper run scoreboard players set @s SD_time 8

execute as @e[type=glow_item_frame,tag=SD_DrawerBlock,tag=SD_hopper,scores={SD_time=8}] at @s if block ~ ~-1 ~ hopper run function simpledrawer:hopper_extract/checkextract
execute as @e[type=glow_item_frame,tag=SD_DrawerBlock,tag=SD_hopper,scores={SD_time=8}] at @s if block ~ ~1 ~ hopper[facing=down] run function simpledrawer:hopper_insert/checkinsert

#Place and destroy
execute as @e[type=glow_item_frame,tag=SD_DrawerBlock] at @s unless block ~ ~ ~ minecraft:beehive run function simpledrawer:destroy/destroy
execute as @e[type=item] if data entity @s {Item:{tag:{Drawer:1b}}} at @s run function simpledrawer:destroy/fast_destroy



#Hacks Fixed NBTtag
execute as @e[type=glow_item_frame,tag=SD_DrawerItem] at @s if block ~ ~ ~ air run data modify entity @s Fixed set value 0b
execute as @e[type=glow_item_frame,tag=SD_DrawerItem] at @s unless block ~ ~ ~ air run data modify entity @s Fixed set value 1b

#Test click

#execute as @e[type=glow_item_frame,tag=SD_DrawerItem,tag=!SD_filled] unless data entity @s {ItemRotation:0b} run function simpledrawer:working/fill/firstfilltest
#execute as @e[type=glow_item_frame,tag=SD_DrawerItem,tag=SD_filled] unless data entity @s {ItemRotation:0b} run function simpledrawer:working/testclick


execute as @a[tag=!SD_book] at @s run function simpledrawer:crafts/guide_craft
tag @a add SD_book

#scoreboard players reset * SD_tempC
scoreboard players set @a SD_sneak 0








