
#Summon and test tapped
execute if entity @s[tag=SD_east] positioned ~0.1 ~ ~ run tag @e[type=glow_item_frame,tag=SD_DrawerItem,sort=nearest,limit=1,tag=SD_east] add SD_selected
execute if entity @s[tag=SD_north] positioned ~ ~ ~-0.1 run tag @e[type=glow_item_frame,tag=SD_DrawerItem,sort=nearest,limit=1,tag=SD_north] add SD_selected
execute if entity @s[tag=SD_south] positioned ~ ~ ~0.1 run tag @e[type=glow_item_frame,tag=SD_DrawerItem,sort=nearest,limit=1,tag=SD_south] add SD_selected
execute if entity @s[tag=SD_west] positioned ~-0.1 ~ ~ run tag @e[type=glow_item_frame,tag=SD_DrawerItem,sort=nearest,limit=1,tag=SD_west] add SD_selected



function simpledrawer:summon
execute as @e[type=glow_item_frame,tag=SD_selected,limit=1] run data modify entity @e[type=item,limit=1,tag=SD_summoned] Item.tag.BlockEntityTag.Items[0].tag.info set from entity @s Item.tag.info

data remove entity @e[type=item,limit=1,tag=SD_summoned] Item.tag.display.Lore
data remove storage simpledrawer:temp maxCount 
data modify storage simpledrawer:temp maxCount set from entity @e[type=item,tag=SD_summoned,limit=1] Item.tag.BlockEntityTag.Items[0].tag.info.maxCount
setblock 0 -64 0 oak_sign{Text1:'[{"text":"0 ","color":"white","italic":false},{"text":"/ ","color":"dark_gray","italic":false},{"nbt":"maxCount","storage":"simpledrawer:temp","color":"white","italic":false}]'} replace
data modify entity @e[type=item,limit=1,tag=SD_summoned] Item.tag.display.Lore append from block 0 -64 0 Text1

setblock 0 -64 0 bedrock



execute store result score model SD_tempC run data get entity @e[type=glow_item_frame,tag=SD_selected,limit=1] Item.tag.info.maxCount
execute if data entity @e[type=glow_item_frame,tag=SD_selected,limit=1] Item.tag.info{hopper:1} run scoreboard players add model SD_tempC 2
execute if entity @e[type=glow_item_frame,tag=SD_selected,tag=filled,limit=1] run scoreboard players add model SD_tempC 1

#limitation https://en.wikipedia.org/wiki/Single-precision_floating-point_format#Precision_limitations_on_integer_values
execute if score model SD_tempC matches 16777216.. run scoreboard players add model SD_tempC 1
execute if data entity @e[type=glow_item_frame,tag=SD_selected,limit=1] Item.tag.info{hopper:1} if score model SD_tempC matches 16777216.. run scoreboard players add model SD_tempC 1
execute if data entity @e[type=glow_item_frame,tag=SD_selected,tag=filled,limit=1] Item.tag.info{hopper:1} if score model SD_tempC matches 16777216.. run scoreboard players add model SD_tempC 1



execute store result entity @e[type=item,limit=1,tag=SD_summoned] Item.tag.CustomModelData long 1 run scoreboard players get model SD_tempC

execute as @e[type=glow_item_frame,tag=SD_selected,tag=filled,limit=1] run function simpledrawer:destroy/destroyfilled

data modify entity @e[type=item,limit=1,tag=SD_summoned] Item.tag.display.Lore append value '{"text":"Simple Drawer","color":"blue","italic":false}'
#all kill

kill @e[type=item,distance=..5,nbt={Age:0s,Item:{id:"minecraft:beehive"}}]
kill @e[type=glow_item_frame,limit=1,tag=SD_selected]

kill @s
tag @e remove SD_summoned
tag @e remove SD_selected