tag @e[type=item,nbt={Item:{id:"minecraft:beehive",Count:1b},Age:0s},limit=1,sort=nearest,distance=..1] add simpledrawer.dropped_item
execute unless entity @e[type=item,tag=simpledrawer.dropped_item] run summon item ~ ~ ~ {Tags:["simpledrawer.dropped_item"],Item:{id:"minecraft:stone",Count:1b}}


data modify storage simpledrawer:main temp.dropped_item set from storage simpledrawer:main ItemsNBT.new_drawer

data modify storage simpledrawer:main temp.dropped_item.tag.simpledrawer set from entity @s item.tag.simpledrawer

data modify entity @e[type=item,tag=simpledrawer.dropped_item,limit=1,sort=nearest] Item set from storage simpledrawer:main temp.dropped_item


scoreboard players operation #search_id simpledrawer.math = @s simpledrawer.new_drawer.id
kill @e[tag=simpledrawer.new_drawer.part,predicate=simpledrawer:search_id_new_drawer]
