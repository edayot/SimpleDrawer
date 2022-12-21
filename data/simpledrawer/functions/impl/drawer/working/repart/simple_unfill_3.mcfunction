
summon item ~ ~ ~ {Tags:["simpledrawer.summoned"],Item:{id:"minecraft:stone",Count:1b}}
data modify entity @e[type=item,tag=simpledrawer.summoned,limit=1] Item set from storage simpledrawer:io output
data modify entity @e[type=item,tag=simpledrawer.summoned,limit=1] Owner set from entity @p[tag=simpledrawer.adder] UUID
scoreboard players set #already simpledrawer.math 1
tag @e[type=item,tag=simpledrawer.summoned,limit=1] remove simpledrawer.summoned
execute as @p[tag=simpledrawer.adder] unless score @s simpledrawer.player.output_cooldown matches -1 run scoreboard players set @s simpledrawer.player.output_cooldown 5
execute as @p[tag=simpledrawer.adder] if score @s simpledrawer.player.output_cooldown matches -1 run scoreboard players set @s simpledrawer.player.output_cooldown 0

execute as @p[tag=simpledrawer.adder] if score @s simpledrawer.config.output_mode matches 0 run scoreboard players set @s simpledrawer.player.input_cooldown 15