
summon item ~ ~ ~ {Tags:["simpledrawer.summoned"],Item:{id:"minecraft:stone",Count:1b}}

data modify entity @e[type=item,tag=simpledrawer.summoned,limit=1] Item set from storage simpledrawer:io output
data modify entity @e[type=item,tag=simpledrawer.summoned,limit=1] Owner set from entity @s UUID
scoreboard players set #already simpledrawer.math 1