#Hopper Compatibility
scoreboard players add @s[tag=simpledrawer.hopper] simpledrawer.time 0
execute as @s[tag=simpledrawer.hopper,scores={simpledrawer.time=1..}] run scoreboard players remove @s simpledrawer.time 1

execute as @s[tag=simpledrawer.hopper,scores={simpledrawer.time=..0}] at @s if block ~ ~1 ~ hopper[facing=down] run function simpledrawer:hopper_insert/checkinsert
execute as @s[tag=simpledrawer.hopper,scores={simpledrawer.time=..0}] at @s if block ~ ~-1 ~ hopper run function simpledrawer:hopper_extract/checkextract


#Destroy system
execute at @s unless block ~ ~ ~ minecraft:beehive run function simpledrawer:destroy/destroy
