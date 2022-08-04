execute at @p run summon item ~ ~ ~ {Tags:["simpledrawer.temp"],Item:{Count:1b,id:"minecraft:stone"},PickupDelay:30s}

data modify entity @e[type=item,tag=simpledrawer.temp,limit=1] Item set from storage simpledrawer:main temp.Items[0]
tag @e[type=item,tag=simpledrawer.temp] remove simpledrawer.temp
data remove storage simpledrawer:main temp.Items[0]
execute if data storage simpledrawer:main temp.Items[0] run function simpledrawer:drawer_connector/gui