
summon item ~ ~ ~ {Tags:["SD_summoned"],Age:1,PickupDelay:0,Motion:[0.0,0.1,0.0],Item:{id:"minecraft:furnace",Count:1b,tag:{SD_simpledrawer:1b,display:{Name:'{"text":"Empty Drawer","italic":false}'},BlockEntityTag:{Items:[{Slot:0b,id:"minecraft:dirt",Count:1b,tag:{info:{type:"wood",hopper:0},Drawer:1b}}],Lock:"SD_DrawerPlacer"}}}}

data modify entity @e[tag=SD_summoned,limit=1,sort=nearest,type=item] Item.tag.BlockEntityTag.Items[0].tag.info.maxCount set from storage simpledrawer:temp Drawers.wood

data remove storage simpledrawer:temp maxCount 
data modify storage simpledrawer:temp maxCount set from entity @e[type=item,tag=SD_summoned,limit=1] Item.tag.BlockEntityTag.Items[0].tag.info.maxCount
data modify entity @e[type=item,tag=SD_summoned,limit=1] Item.tag.CustomModelData set value 42000L

execute in simpledrawer:intern run setblock 0 -64 0 oak_sign{Text1:'[{"text":"0 ","color":"white","italic":false},{"text":"/ ","color":"dark_gray","italic":false},{"nbt":"maxCount","storage":"simpledrawer:temp","color":"white","italic":false}]'} replace
execute in simpledrawer:intern run data modify entity @e[type=item,limit=1,tag=SD_summoned] Item.tag.display.Lore append from block 0 -64 0 Text1
execute in simpledrawer:intern run data modify entity @e[type=item,limit=1,tag=SD_summoned] Item.tag.display.Lore append value '{"text":"Simple Drawer","color":"blue","italic":false}'
execute in simpledrawer:intern run setblock 0 -64 0 bedrock
