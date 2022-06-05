#Hopper Compatibility
scoreboard players add @s[tag=simpledrawer.hopper] simpledrawer.time 0
execute as @s[tag=simpledrawer.hopper,scores={simpledrawer.time=1..}] run scoreboard players remove @s simpledrawer.time 1


execute as @s[tag=simpledrawer.hopper,scores={simpledrawer.time=..0}] run function simpledrawer:working/check_hopper

#Destroy system
execute at @s unless block ~ ~ ~ minecraft:beehive run function simpledrawer:destroy/destroy
