data modify entity @s Item set from storage simpledrawer:io output
data modify entity @s Owner set from entity @p[tag=simpledrawer.attacker] UUID
tag @s remove simpledrawer.summoned
