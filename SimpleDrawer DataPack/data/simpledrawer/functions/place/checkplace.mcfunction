
#execute positioned ~ ~-1 ~ if data block ~ ~ ~ {Lock:"SD_DrawerPlacer"} run function simpledrawer:place/place

setblock 0 -64 0 chest{Items:[{Slot:0b,id:"minecraft:diamond",Count:1b}]} replace
item modify block 0 -64 0 container.0 simpledrawer:get_pos

execute store result score delta_x SD_tempC run data get block 0 -64 0 Items[0].tag.pos[0]

execute store result score delta_y SD_tempC run data get block 0 -64 0 Items[0].tag.pos[1]

execute store result score delta_z SD_tempC run data get block 0 -64 0 Items[0].tag.pos[2]

execute store result score placer_x SD_tempC run data get entity @s Pos[0]
execute store result score placer_y SD_tempC run data get entity @s Pos[1]
execute store result score placer_z SD_tempC run data get entity @s Pos[2]

scoreboard players operation placer_x SD_tempC += delta_x SD_tempC
scoreboard players operation placer_y SD_tempC += delta_y SD_tempC
scoreboard players operation placer_z SD_tempC += delta_z SD_tempC


summon marker 0 -64 0 {Tags:["SD_Placer"]}

execute store result entity @e[limit=1,type=marker,tag=SD_Placer] Pos[0] double 1 run scoreboard players get placer_x SD_tempC
execute store result entity @e[limit=1,type=marker,tag=SD_Placer] Pos[1] double 1 run scoreboard players get placer_y SD_tempC
execute store result entity @e[limit=1,type=marker,tag=SD_Placer] Pos[2] double 1 run scoreboard players get placer_z SD_tempC

execute at @e[type=marker,tag=SD_Placer] run function simpledrawer:place/place

kill @e[type=marker,tag=SD_Placer]
setblock 0 -64 0 bedrock
