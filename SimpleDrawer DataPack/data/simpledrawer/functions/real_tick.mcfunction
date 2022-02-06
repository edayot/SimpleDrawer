#Hopper compatibility 
scoreboard players add @e[type=glow_item_frame,tag=simpledrawer.DrawerBlock,tag=simpledrawer.hopper] simpledrawer.time 0
execute as @e[type=glow_item_frame,tag=simpledrawer.DrawerBlock,tag=simpledrawer.hopper,scores={simpledrawer.time=1..}] run scoreboard players remove @s simpledrawer.time 1


execute as @e[type=glow_item_frame,tag=simpledrawer.DrawerBlock,tag=simpledrawer.hopper,scores={simpledrawer.time=..0}] at @s if block ~ ~1 ~ hopper[facing=down] run scoreboard players set @s simpledrawer.time 8
execute as @e[type=glow_item_frame,tag=simpledrawer.DrawerBlock,tag=simpledrawer.hopper,scores={simpledrawer.time=..0}] at @s if block ~ ~-1 ~ hopper run scoreboard players set @s simpledrawer.time 8

execute as @e[type=glow_item_frame,tag=simpledrawer.DrawerBlock,tag=simpledrawer.hopper,scores={simpledrawer.time=8}] at @s if block ~ ~-1 ~ hopper run function simpledrawer:hopper_extract/checkextract
execute as @e[type=glow_item_frame,tag=simpledrawer.DrawerBlock,tag=simpledrawer.hopper,scores={simpledrawer.time=8}] at @s if block ~ ~1 ~ hopper[facing=down] run function simpledrawer:hopper_insert/checkinsert

# rename from previous tag on destroy
execute as @e[type=glow_item_frame,tag=SD_DrawerBlock] at @s unless block ~ ~ ~ minecraft:beehive run function simpledrawer:rename_tag

#Place and destroy
execute as @e[type=glow_item_frame,tag=simpledrawer.DrawerBlock] at @s unless block ~ ~ ~ minecraft:beehive run function simpledrawer:destroy/destroy
execute as @e[type=item] if data entity @s {Item:{tag:{Drawer:1b}}} at @s run function simpledrawer:destroy/fast_destroy



#Hacks Fixed NBTtag
execute as @e[type=glow_item_frame,tag=simpledrawer.DrawerItem] at @s if block ~ ~ ~ air run data modify entity @s Fixed set value 0b
execute as @e[type=glow_item_frame,tag=simpledrawer.DrawerItem] at @s unless block ~ ~ ~ air run data modify entity @s Fixed set value 1b

#Test click

#execute as @e[type=glow_item_frame,tag=simpledrawer.DrawerItem,tag=!simpledrawer.filled] unless data entity @s {ItemRotation:0b} run function simpledrawer:working/fill/firstfilltest
#execute as @e[type=glow_item_frame,tag=simpledrawer.DrawerItem,tag=simpledrawer.filled] unless data entity @s {ItemRotation:0b} run function simpledrawer:working/testclick


execute as @a[tag=!simpledrawer.book] at @s run function simpledrawer:crafts/guide_craft
tag @a add simpledrawer.book

#scoreboard players reset * simpledrawer.tempC
scoreboard players set @a simpledrawer.sneak 0








