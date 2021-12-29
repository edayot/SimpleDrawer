
#North
execute if block ~ ~ ~ minecraft:furnace[facing=north] run function simpledrawer:place/orientation/north


#East
execute if block ~ ~ ~ minecraft:furnace[facing=east] run function simpledrawer:place/orientation/east

#South
execute if block ~ ~ ~ minecraft:furnace[facing=south] run function simpledrawer:place/orientation/south

#West
execute if block ~ ~ ~ minecraft:furnace[facing=west] run function simpledrawer:place/orientation/west

data modify entity @e[tag=SD_summoned,limit=1,sort=nearest,type=glow_item_frame] Item.tag.info.maxCount set from storage simpledrawer:temp Drawers.wood




#Test filled
data modify entity @e[type=glow_item_frame,tag=SD_summoned,limit=1] Item.tag.info set from block ~ ~ ~ Items[0].tag.info



execute if data block ~ ~ ~ Items[0].tag.data run function simpledrawer:place/placefilled

execute as @e[type=glow_item_frame,tag=SD_summoned,limit=1] run function simpledrawer:working/set_max_count

execute as @e[type=glow_item_frame,tag=SD_summoned,limit=1] run function simpledrawer:working/display

execute if data entity @e[type=glow_item_frame,tag=SD_summoned,limit=1] Item.tag.info{hopper:1} run tag @e[type=glow_item_frame,tag=SD_summoned2,limit=1] add SD_hopper
#kill and reset
tag @e remove SD_summoned
tag @e remove SD_summoned2

#Place block after to had access to the furnace
execute if block ~ ~ ~ minecraft:furnace[facing=north] run setblock ~ ~ ~ minecraft:beehive[facing=north]
execute if block ~ ~ ~ minecraft:furnace[facing=south] run setblock ~ ~ ~ minecraft:beehive[facing=south]
execute if block ~ ~ ~ minecraft:furnace[facing=east] run setblock ~ ~ ~ minecraft:beehive[facing=east]
execute if block ~ ~ ~ minecraft:furnace[facing=west] run setblock ~ ~ ~ minecraft:beehive[facing=west]

