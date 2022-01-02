function simpledrawer:summon
data modify entity @e[tag=SD_summoned,limit=1,sort=nearest] Item.tag.BlockEntityTag.Items[0] set from entity @s Item
data remove entity @e[type=item,limit=1,tag=SD_summoned] Item.tag.display.Lore




data modify entity @e[type=item,limit=1,tag=SD_summoned] Item.tag.display.Lore append value '{"translate":"simpledrawer.name","color":"blue","italic":false}'
tag @e remove SD_summoned
kill @s
kill @e[type=item,distance=..5,nbt={Age:0s,Item:{id:"minecraft:furnace"}}]