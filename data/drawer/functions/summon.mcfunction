#summon item ~ ~ ~ {Tags:["SD_summoned"],Age:1,PickupDelay:5,Motion:[0.0,0.1,0.0],Item:{id:"minecraft:furnace",Count:1b,tag:{CustomModelData:256,display:{Name:'{"text":"Empty Drawer","bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false}'},EntityTag:{id:"minecraft:armor_stand",Invulnerable:1b,Small:1b,Marker:1b,Invisible:1b,Tags:["Dspawn"],ArmorItems:[{},{},{},{id:"minecraft:beehive",Count:1b,tag:{info:{maxCount:256}}}]}}}}

summon item ~ ~ ~ {Tags:["SD_summoned"],Age:1,PickupDelay:0,Motion:[0.0,0.1,0.0],Item:{id:"minecraft:furnace",Count:1b,tag:{SD_Drawer:1b,display:{Name:'{"text":"Empty Drawer","italic":false}'},BlockEntityTag:{Items:[{Slot:0b,id:"minecraft:diamond",Count:1b,tag:{info:{maxCount:256L}}}],Lock:"SD_DrawerPlacer"}}}}

data remove storage drawer:temp maxCount 
data modify storage drawer:temp maxCount set from entity @e[type=item,tag=SD_summoned,limit=1] Item.tag.BlockEntityTag.Items[0].tag.info.maxCount
data modify entity @e[type=item,tag=SD_summoned,limit=1] Item.tag.CustomModelData set from entity @e[type=item,tag=SD_summoned,limit=1] Item.tag.BlockEntityTag.Items[0].tag.info.maxCount

setblock 0 0 0 oak_sign{Text1:'[{"text":"0 ","color":"white","italic":false},{"text":"/ ","color":"dark_gray","italic":false},{"nbt":"maxCount","storage":"drawer:temp","color":"white","italic":false}]'} replace
data modify entity @e[type=item,limit=1,tag=SD_summoned] Item.tag.display.Lore append from block 0 0 0 Text1
setblock 0 0 0 bedrock
