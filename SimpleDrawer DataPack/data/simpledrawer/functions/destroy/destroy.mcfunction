
tag @s add simpledrawer.selected2
execute as @e[distance=..1.5,type=minecraft:glow_item_frame,tag=simpledrawer.DrawerItem] run function simpledrawer:destroy/test_uuid_for_item

tag @e[scores={simpledrawer.tempC=0},distance=..1.5,tag=simpledrawer.DrawerItem] add simpledrawer.selected



#Summon and test tapped
#execute unless entity @e[type=glow_item_frame,tag=simpledrawer.selected] if entity @s[tag=simpledrawer.east] positioned ~0.1 ~ ~ run tag @e[distance=..0.8,type=glow_item_frame,tag=simpledrawer.DrawerItem,sort=nearest,limit=1,tag=simpledrawer.east] add simpledrawer.selected
#execute unless entity @e[type=glow_item_frame,tag=simpledrawer.selected] if entity @s[tag=simpledrawer.north] positioned ~ ~ ~-0.1 run tag @e[distance=..0.8,type=glow_item_frame,tag=simpledrawer.DrawerItem,sort=nearest,limit=1,tag=simpledrawer.north] add simpledrawer.selected
#execute unless entity @e[type=glow_item_frame,tag=simpledrawer.selected] if entity @s[tag=simpledrawer.south] positioned ~ ~ ~0.1 run tag @e[distance=..0.8,type=glow_item_frame,tag=simpledrawer.DrawerItem,sort=nearest,limit=1,tag=simpledrawer.south] add simpledrawer.selected
#execute unless entity @e[type=glow_item_frame,tag=simpledrawer.selected] if entity @s[tag=simpledrawer.west] positioned ~-0.1 ~ ~ run tag @e[distance=..0.8,type=glow_item_frame,tag=simpledrawer.DrawerItem,sort=nearest,limit=1,tag=simpledrawer.west] add simpledrawer.selected



summon item ~ ~ ~ {Tags:["simpledrawer.summoned"],Item:{id:"minecraft:stone",Count:1b}}
data modify entity @e[type=item,tag=simpledrawer.summoned,limit=1,sort=nearest] Item set from storage simpledrawer:temp ItemsNBT.drawer
data remove entity @e[type=glow_item_frame,tag=simpledrawer.selected,limit=1] Item.tag.info.Owner
execute as @e[type=glow_item_frame,tag=simpledrawer.selected,limit=1] run data modify entity @e[type=item,limit=1,tag=simpledrawer.summoned] Item.tag.BlockEntityTag.Items[0].tag.info set from entity @s Item.tag.info

data remove entity @e[type=item,limit=1,tag=simpledrawer.summoned] Item.tag.display.Lore
data remove storage simpledrawer:temp maxCount 
data modify storage simpledrawer:temp maxCount set from entity @e[type=item,tag=simpledrawer.summoned,limit=1] Item.tag.BlockEntityTag.Items[0].tag.info.maxCount
execute in simpledrawer:intern run setblock 0 -64 0 oak_sign{Text1:'[{"text":"0 ","color":"white","italic":false},{"text":"/ ","color":"dark_gray","italic":false},{"nbt":"maxCount","storage":"simpledrawer:temp","color":"white","italic":false}]'} replace
execute in simpledrawer:intern run data modify entity @e[type=item,limit=1,tag=simpledrawer.summoned] Item.tag.display.Lore append from block 0 -64 0 Text1

execute in simpledrawer:intern run setblock 0 -64 0 bedrock




scoreboard players set model simpledrawer.tempC 1430000
execute if entity @e[type=glow_item_frame,tag=simpledrawer.selected,tag=simpledrawer.filled,limit=1] run scoreboard players add model simpledrawer.tempC 1
execute if data entity @e[type=glow_item_frame,tag=simpledrawer.selected,limit=1] Item.tag.info{hopper:1} run scoreboard players add model simpledrawer.tempC 2
execute if data entity @e[type=glow_item_frame,tag=simpledrawer.selected,limit=1] Item.tag.info{type:"iron"} run scoreboard players add model simpledrawer.tempC 4
execute if data entity @e[type=glow_item_frame,tag=simpledrawer.selected,limit=1] Item.tag.info{type:"gold"} run scoreboard players add model simpledrawer.tempC 8
execute if data entity @e[type=glow_item_frame,tag=simpledrawer.selected,limit=1] Item.tag.info{type:"diamond"} run scoreboard players add model simpledrawer.tempC 12
execute if data entity @e[type=glow_item_frame,tag=simpledrawer.selected,limit=1] Item.tag.info{type:"star"} run scoreboard players add model simpledrawer.tempC 16
execute if data entity @e[type=glow_item_frame,tag=simpledrawer.selected,limit=1] Item.tag.info{type:"netherite"} run scoreboard players add model simpledrawer.tempC 20


execute store result entity @e[type=item,limit=1,tag=simpledrawer.summoned] Item.tag.CustomModelData long 1 run scoreboard players get model simpledrawer.tempC

execute as @e[type=glow_item_frame,tag=simpledrawer.selected,tag=simpledrawer.filled,limit=1] run function simpledrawer:destroy/destroyfilled

data modify entity @e[type=item,limit=1,tag=simpledrawer.summoned] Item.tag.display.Lore append value '{"translate":"simpledrawer.name","color":"blue","italic":false}'
#all kill

kill @e[type=item,distance=..5,nbt={Age:0s,Item:{id:"minecraft:beehive"}}]
kill @e[type=glow_item_frame,limit=1,tag=simpledrawer.selected]

kill @s
tag @e[type=item,tag=simpledrawer.summoned] remove simpledrawer.summoned
tag @e[type=glow_item_frame,tag=simpledrawer.selected] remove simpledrawer.selected