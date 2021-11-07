
#North
execute if block ~ ~ ~ minecraft:furnace[facing=north] run function drawer:place/orientation/north


#East
execute if block ~ ~ ~ minecraft:furnace[facing=east] run function drawer:place/orientation/east

#South
execute if block ~ ~ ~ minecraft:furnace[facing=south] run function drawer:place/orientation/south

#West
execute if block ~ ~ ~ minecraft:furnace[facing=west] run function drawer:place/orientation/west



scoreboard players remove @s[scores={SD_Place=1..}] SD_Place 1

#Test filled
data modify entity @e[type=glow_item_frame,tag=SD_summoned,limit=1] Item.tag.info set from block ~ ~ ~ Items[0].tag.info


execute if data block ~ ~ ~ Items[0].tag.data run function drawer:place/placefilled




execute as @e[type=glow_item_frame,tag=SD_summoned,limit=1] run function drawer:working/display

execute if data entity @e[type=glow_item_frame,tag=SD_summoned,limit=1] Item.tag.info{hopper:1} run tag @e[type=glow_item_frame,tag=SD_summoned2,limit=1] add SD_hopper
#kill and reset
tag @e remove SD_summoned
tag @e remove SD_summoned2

#Place block after to had access to the furnace
execute if block ~ ~ ~ minecraft:furnace[facing=north] run setblock ~ ~ ~ minecraft:beehive[facing=north]
execute if block ~ ~ ~ minecraft:furnace[facing=south] run setblock ~ ~ ~ minecraft:beehive[facing=south]
execute if block ~ ~ ~ minecraft:furnace[facing=east] run setblock ~ ~ ~ minecraft:beehive[facing=east]
execute if block ~ ~ ~ minecraft:furnace[facing=west] run setblock ~ ~ ~ minecraft:beehive[facing=west]

