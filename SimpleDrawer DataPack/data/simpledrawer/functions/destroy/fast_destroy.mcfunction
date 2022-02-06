summon item ~ ~ ~ {Tags:["simpledrawer.summoned"],Item:{id:"minecraft:stone",Count:1b}}
data modify entity @e[type=item,tag=simpledrawer.summoned,limit=1,sort=nearest] Item set from storage simpledrawer:temp ItemsNBT.drawer
data modify entity @e[tag=simpledrawer.summoned,limit=1,sort=nearest] Item.tag.BlockEntityTag.Items[0] set from entity @s Item
data remove entity @e[type=item,limit=1,tag=simpledrawer.summoned] Item.tag.display.Lore




data modify entity @e[type=item,limit=1,tag=simpledrawer.summoned] Item.tag.display.Lore append value '{"translate":"simpledrawer.name","color":"blue","italic":false}'
tag @e remove simpledrawer.summoned
kill @s
kill @e[type=item,distance=..5,nbt={Age:0s,Item:{id:"minecraft:furnace"}}]