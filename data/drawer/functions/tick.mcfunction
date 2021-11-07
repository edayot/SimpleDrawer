#Hopper compatibility 

execute if score 7t SD_time matches 0 as @e[type=glow_item_frame,tag=SD_DrawerBlock,tag=SD_hopper] at @s if block ~ ~-1 ~ hopper run function drawer:hopper/checkextract
execute if score 7t SD_time matches 0 as @e[type=glow_item_frame,tag=SD_DrawerBlock,tag=SD_hopper] at @s if block ~ ~1 ~ hopper[facing=down] run function drawer:hopper_insert/checkinsert

#Place and destroy
execute as @a[scores={SD_Place=1..}] at @s run function drawer:place/checkplace
execute as @e[type=glow_item_frame,tag=SD_DrawerBlock] at @s unless block ~ ~ ~ minecraft:beehive run function drawer:destroy/destroy



#Hacks Fixed NBTtag
execute as @e[type=glow_item_frame,tag=SD_DrawerItem] at @s if block ~ ~ ~ air run data modify entity @s Fixed set value 0b
execute as @e[type=glow_item_frame,tag=SD_DrawerItem] at @s unless block ~ ~ ~ air run data modify entity @s Fixed set value 1b

#Test click
execute as @e[type=glow_item_frame,tag=SD_DrawerItem,tag=!filled] unless data entity @s {ItemRotation:0b} run function drawer:working/fill/firstfilltest
execute as @e[type=glow_item_frame,tag=SD_DrawerItem,tag=filled] unless data entity @s {ItemRotation:0b} run function drawer:working/testclick



execute as @e[type=glow_item_frame,tag=SD_DrawerBlock] run data merge entity @s {Fire:1000s}
#scoreboard players reset * SD_tempC
scoreboard players set @a SD_sneak 0
scoreboard players reset @a place


scoreboard players reset * SD_click

scoreboard players add 7t SD_time 1
execute if score 7t SD_time matches 7.. run scoreboard players set 7t SD_time 0


#data remove storage drawer:temp ItemDrawer
#data remove storage drawer:temp ItemHopper
#data remove storage drawer:temp ItemAdded
data remove storage drawer:temp ItemUnfilled
data remove storage drawer:temp Name
data remove storage drawer:temp Count
data remove storage drawer:temp id
data remove storage drawer:temp ItemPlace
data remove storage drawer:temp info