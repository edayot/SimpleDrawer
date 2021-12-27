#Name and texture
data remove storage simpledrawer:temp Name
data remove storage simpledrawer:temp Count
data remove storage simpledrawer:temp id


data modify entity @e[type=item,limit=1,tag=SD_summoned] Item.tag.BlockEntityTag.Items[0].tag.data set from entity @s Item.tag.data

data modify entity @e[type=item,limit=1,tag=SD_summoned] Item.tag.display.Name set value '{"text":"Filled Drawer","bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false}'

#Custom Lore
data remove entity @e[type=item,limit=1,tag=SD_summoned] Item.tag.display.Lore
execute store result score temp SD_tempC run data get entity @s Item.tag.data.Count
data modify storage simpledrawer:temp id set from entity @s Item.tag.data.id
data modify storage simpledrawer:temp Name set from entity @s Item.tag.data.tag.display.Name
data modify storage simpledrawer:temp maxCount set from entity @s Item.tag.info.maxCount

execute in simpledrawer:intern run setblock 0 -64 0 oak_sign{Text1:'[{"score":{"name":"temp","objective":"SD_tempC"},"color":"white","italic":false},{"text":" / ","color":"dark_gray","italic":false},{"nbt":"maxCount","storage":"simpledrawer:temp","color":"white","italic":false},{"text":" of ","color":"gray","italic":false},{"nbt":"id","storage":"simpledrawer:temp","color":"gold","italic":false}]',Text2:'[{"text":"Named :  §r","color":"gray","italic":false},{"nbt":"Name","storage":"simpledrawer:temp","interpret":true,"italic":false}]'} replace
execute in simpledrawer:intern run data modify entity @e[type=item,limit=1,tag=SD_summoned] Item.tag.display.Lore append from block 0 -64 0 Text1
execute in simpledrawer:intern if data entity @s Item.tag.data.tag.display.Name run data modify entity @e[type=item,limit=1,tag=SD_summoned] Item.tag.display.Lore append from block 0 -64 0 Text2
execute in simpledrawer:intern run setblock 0 -64 0 bedrock
