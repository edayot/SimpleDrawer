advancement revoke @s only simpledrawer:drawer_place_old

#execute positioned ~ ~-1 ~ if data block ~ ~ ~ {Lock:"simpledrawer.DrawerPlacer"} run function simpledrawer:place/place
summon chest_minecart ~ 320 ~ {Tags:["simpledrawer.GetPos"],Items:[{Slot:0b,id:"minecraft:dirt",Count:1b}]}
item modify entity @e[tag=simpledrawer.GetPos,type=minecraft:chest_minecart] container.0 simpledrawer:get_pos_old

execute store result score delta_x simpledrawer.tempC run data get entity @e[tag=simpledrawer.GetPos,type=minecraft:chest_minecart,limit=1] Items[0].tag.pos[0]

execute store result score delta_y simpledrawer.tempC run data get entity @e[tag=simpledrawer.GetPos,type=minecraft:chest_minecart,limit=1] Items[0].tag.pos[1]

execute store result score delta_z simpledrawer.tempC run data get entity @e[tag=simpledrawer.GetPos,type=minecraft:chest_minecart,limit=1] Items[0].tag.pos[2]

execute store result score placer_x simpledrawer.tempC run data get entity @s Pos[0]
execute store result score placer_y simpledrawer.tempC run data get entity @s Pos[1]
execute store result score placer_z simpledrawer.tempC run data get entity @s Pos[2]

scoreboard players operation placer_x simpledrawer.tempC += delta_x simpledrawer.tempC
scoreboard players operation placer_y simpledrawer.tempC += delta_y simpledrawer.tempC
scoreboard players operation placer_z simpledrawer.tempC += delta_z simpledrawer.tempC


summon marker ~ ~ ~ {Tags:["simpledrawer.Placer"]}

execute store result entity @e[limit=1,type=marker,tag=simpledrawer.Placer] Pos[0] double 1 run scoreboard players get placer_x simpledrawer.tempC
execute store result entity @e[limit=1,type=marker,tag=simpledrawer.Placer] Pos[1] double 1 run scoreboard players get placer_y simpledrawer.tempC
execute store result entity @e[limit=1,type=marker,tag=simpledrawer.Placer] Pos[2] double 1 run scoreboard players get placer_z simpledrawer.tempC

execute at @e[type=marker,tag=simpledrawer.Placer] run function simpledrawer:place/place

kill @e[type=marker,tag=simpledrawer.Placer]
tp @e[tag=simpledrawer.GetPos,type=minecraft:chest_minecart] ~ -128 ~