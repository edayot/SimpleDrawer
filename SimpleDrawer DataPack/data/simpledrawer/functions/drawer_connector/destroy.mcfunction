tag @e[type=item,nbt={Item:{id:"minecraft:barrel",Count:1b},Age:0s},limit=1,sort=nearest,distance=..1] add simpledrawer.dropped_item
execute unless entity @e[type=item,tag=simpledrawer.dropped_item] run summon item ~ ~ ~ {Tags:["simpledrawer.dropped_item"],Item:{id:"minecraft:stone",Count:1b}}

data modify entity @e[tag=simpledrawer.dropped_item,limit=1] Item set from storage simpledrawer:main ItemsNBT.drawer_connector

tag @e[type=item,tag=simpledrawer.dropped_item] remove simpledrawer.dropped_item
kill @s