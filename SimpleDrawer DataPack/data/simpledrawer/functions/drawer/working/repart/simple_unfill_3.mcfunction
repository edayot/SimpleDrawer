
summon item ~ ~ ~ {Tags:["simpledrawer.summoned"],Item:{id:"minecraft:stone",Count:1b}}
data modify entity @e[type=item,tag=simpledrawer.summoned,limit=1] Item set from storage simpledrawer:io output
data modify entity @e[type=item,tag=simpledrawer.summoned,limit=1] Owner set from entity @p[tag=simpledrawer.adder] UUID
scoreboard players set #already simpledrawer.math 1
tag @e[type=item,tag=simpledrawer.summoned,limit=1] remove simpledrawer.summoned