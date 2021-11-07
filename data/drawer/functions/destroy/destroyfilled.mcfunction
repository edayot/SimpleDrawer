#Name and texture


data modify entity @e[type=item,limit=1,tag=SD_summoned] Item.tag.BlockEntityTag.Items[0].tag.data set from entity @s Item.tag.data

data modify entity @e[type=item,limit=1,tag=SD_summoned] Item.tag.display.Name set value '{"text":"Filled Drawer","bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false}'

#Custom Lore
data remove entity @e[type=item,limit=1,tag=SD_summoned] Item.tag.display.Lore
execute store result score temp SD_tempC run data get entity @s Item.tag.data.Count
data modify storage drawer:temp id set from entity @s Item.tag.data.id
data modify storage drawer:temp Name set from entity @s Item.tag.data.tag.display.Name
data modify storage drawer:temp maxCount set from entity @s Item.tag.info.maxCount

setblock 0 0 0 oak_sign{Text1:'[{"score":{"name":"temp","objective":"SD_tempC"},"color":"white","italic":false},{"text":" / ","color":"dark_gray","italic":false},{"nbt":"maxCount","storage":"drawer:temp","color":"white","italic":false},{"text":" of ","color":"gray","italic":false},{"nbt":"id","storage":"drawer:temp","color":"gold","italic":false}]',Text2:'[{"text":"Named :  §r","color":"gray","italic":false},{"nbt":"Name","storage":"drawer:temp","interpret":true,"italic":false}]'} replace
data modify entity @e[type=item,limit=1,tag=SD_summoned] Item.tag.display.Lore append from block 0 0 0 Text1
execute if data entity @s Item.tag.data.tag.display.Name run data modify entity @e[type=item,limit=1,tag=SD_summoned] Item.tag.display.Lore append from block 0 0 0 Text2
setblock 0 0 0 bedrock
