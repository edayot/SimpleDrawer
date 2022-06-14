

data modify entity @e[type=item,tag=simpledrawer.summoned,limit=1] Item set from storage simpledrawer:io output
data modify entity @e[type=item,tag=simpledrawer.summoned,limit=1] Owner set from entity @s UUID
scoreboard players set #already simpledrawer.math 1
tag @e[type=item,tag=simpledrawer.summoned,limit=1] remove simpledrawer.summoned