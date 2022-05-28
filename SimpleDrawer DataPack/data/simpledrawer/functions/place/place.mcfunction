
#North
execute if block ~ ~ ~ minecraft:furnace[facing=north] run function simpledrawer:place/orientation/north

#East
execute if block ~ ~ ~ minecraft:furnace[facing=east] run function simpledrawer:place/orientation/east

#South
execute if block ~ ~ ~ minecraft:furnace[facing=south] run function simpledrawer:place/orientation/south

#West
execute if block ~ ~ ~ minecraft:furnace[facing=west] run function simpledrawer:place/orientation/west





data modify entity @e[tag=simpledrawer.summoned,limit=1,sort=nearest,type=glow_item_frame] Item.tag.info.maxCount set from storage simpledrawer:temp Drawers.wood




#Test filled
data modify entity @e[type=glow_item_frame,tag=simpledrawer.summoned,limit=1] Item.tag.info set from block ~ ~ ~ Items[0].tag.info

scoreboard players add #global_id simpledrawer.drawer_id 1
scoreboard players operation @e[type=glow_item_frame,tag=simpledrawer.summoned,limit=1] simpledrawer.drawer_id = #global_id simpledrawer.drawer_id
scoreboard players operation @e[type=glow_item_frame,tag=simpledrawer.summoned2,limit=1] simpledrawer.drawer_id = #global_id simpledrawer.drawer_id
#UUID copy in Item.tag.info.Owner
data modify entity @e[type=glow_item_frame,tag=simpledrawer.summoned,limit=1] Item.tag.info.Owner set from entity @e[type=glow_item_frame,tag=simpledrawer.summoned2,limit=1] UUID
data modify entity @e[type=glow_item_frame,tag=simpledrawer.summoned2,limit=1] Item.tag.info.Owner set from entity @e[type=glow_item_frame,tag=simpledrawer.summoned,limit=1] UUID


execute if data block ~ ~ ~ Items[0].tag.data run function simpledrawer:place/placefilled

execute as @e[type=glow_item_frame,tag=simpledrawer.summoned,limit=1] run function simpledrawer:working/set_max_count

execute as @e[type=glow_item_frame,tag=simpledrawer.summoned,limit=1] run function simpledrawer:working/display

execute if data entity @e[type=glow_item_frame,tag=simpledrawer.summoned,limit=1] Item.tag.info{hopper:1} run tag @e[type=glow_item_frame,tag=simpledrawer.summoned2,limit=1] add simpledrawer.hopper
#kill and reset


#Place block after to had access to the furnace
execute if block ~ ~ ~ minecraft:furnace[facing=north] run setblock ~ ~ ~ minecraft:beehive[facing=north]
execute if block ~ ~ ~ minecraft:furnace[facing=south] run setblock ~ ~ ~ minecraft:beehive[facing=south]
execute if block ~ ~ ~ minecraft:furnace[facing=east] run setblock ~ ~ ~ minecraft:beehive[facing=east]
execute if block ~ ~ ~ minecraft:furnace[facing=west] run setblock ~ ~ ~ minecraft:beehive[facing=west]

tag @e[type=glow_item_frame,tag=simpledrawer.summoned] add global.ignore
tag @e[type=glow_item_frame,tag=simpledrawer.summoned2] add global.ignore


tag @e[type=glow_item_frame,tag=simpledrawer.summoned] remove simpledrawer.summoned
tag @e[type=glow_item_frame,tag=simpledrawer.summoned2] remove simpledrawer.summoned2

