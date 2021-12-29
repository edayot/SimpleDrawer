advancement revoke @s only simpledrawer:drawer_place
#execute positioned ~ ~-1 ~ if data block ~ ~ ~ {Lock:"SD_DrawerPlacer"} run function simpledrawer:place/place
summon chest_minecart ~ 320 ~ {Tags:["SD_GetPos"],Items:[{Slot:0b,id:"minecraft:dirt",Count:1b}]}
item modify entity @e[tag=SD_GetPos,type=minecraft:chest_minecart] container.0 simpledrawer:get_pos

execute store result score delta_x SD_tempC run data get entity @e[tag=SD_GetPos,type=minecraft:chest_minecart,limit=1] Items[0].tag.pos[0]

execute store result score delta_y SD_tempC run data get entity @e[tag=SD_GetPos,type=minecraft:chest_minecart,limit=1] Items[0].tag.pos[1]

execute store result score delta_z SD_tempC run data get entity @e[tag=SD_GetPos,type=minecraft:chest_minecart,limit=1] Items[0].tag.pos[2]

execute store result score placer_x SD_tempC run data get entity @s Pos[0]
execute store result score placer_y SD_tempC run data get entity @s Pos[1]
execute store result score placer_z SD_tempC run data get entity @s Pos[2]

scoreboard players operation placer_x SD_tempC += delta_x SD_tempC
scoreboard players operation placer_y SD_tempC += delta_y SD_tempC
scoreboard players operation placer_z SD_tempC += delta_z SD_tempC


summon marker ~ ~ ~ {Tags:["SD_Placer"]}

execute store result entity @e[limit=1,type=marker,tag=SD_Placer] Pos[0] double 1 run scoreboard players get placer_x SD_tempC
execute store result entity @e[limit=1,type=marker,tag=SD_Placer] Pos[1] double 1 run scoreboard players get placer_y SD_tempC
execute store result entity @e[limit=1,type=marker,tag=SD_Placer] Pos[2] double 1 run scoreboard players get placer_z SD_tempC

execute at @e[type=marker,tag=SD_Placer] run function simpledrawer:place/place

kill @e[type=marker,tag=SD_Placer]
tp @e[tag=SD_GetPos,type=minecraft:chest_minecart] ~ -128 ~