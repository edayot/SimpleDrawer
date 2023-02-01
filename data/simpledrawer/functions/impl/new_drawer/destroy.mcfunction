tag @e[type=item,nbt={Item:{id:"minecraft:chiseled_bookshelf",Count:1b},Age:0s},limit=1,sort=nearest,distance=..1] add simpledrawer.dropped_item
execute unless entity @e[type=item,tag=simpledrawer.dropped_item] run summon item ~ ~ ~ {Tags:["simpledrawer.dropped_item"],Item:{id:"minecraft:stone",Count:1b}}


#copy the item and apply count 
data modify storage simpledrawer:main temp.dropped_item set from storage simpledrawer:main ItemsNBT.new_drawer

data modify storage simpledrawer:main temp.dropped_item.tag.BlockEntityTag.Items[0] merge from entity @s Item

execute store result storage simpledrawer:main temp.dropped_item.tag.BlockEntityTag.Items[0].tag.simpledrawer.Item0.Count byte 1 run scoreboard players get @s simpledrawer.drawer.Count0
execute store result storage simpledrawer:main temp.dropped_item.tag.BlockEntityTag.Items[0].tag.simpledrawer.Item1.Count byte 1 run scoreboard players get @s simpledrawer.drawer.Count1
execute store result storage simpledrawer:main temp.dropped_item.tag.BlockEntityTag.Items[0].tag.simpledrawer.Item2.Count byte 1 run scoreboard players get @s simpledrawer.drawer.Count2
execute store result storage simpledrawer:main temp.dropped_item.tag.BlockEntityTag.Items[0].tag.simpledrawer.Item3.Count byte 1 run scoreboard players get @s simpledrawer.drawer.Count3
execute store result storage simpledrawer:main temp.dropped_item.tag.BlockEntityTag.Items[0].tag.simpledrawer.Item4.Count byte 1 run scoreboard players get @s simpledrawer.drawer.Count4
execute store result storage simpledrawer:main temp.dropped_item.tag.BlockEntityTag.Items[0].tag.simpledrawer.Item5.Count byte 1 run scoreboard players get @s simpledrawer.drawer.Count5

execute store result storage simpledrawer:main temp.dropped_item.tag.BlockEntityTag.Items[0].tag.simpledrawer.nb_enabled byte 1 run scoreboard players get @s simpledrawer.drawer.nb_enabled

#display




data modify entity @e[type=item,tag=simpledrawer.dropped_item,limit=1,sort=nearest] Item set from storage simpledrawer:main temp.dropped_item
tag @e[type=item,tag=simpledrawer.dropped_item] remove simpledrawer.dropped_item
kill @e[type=item,nbt={Item:{id:"minecraft:book",tag:{simpledrawer:{drawer_book:1b}}},Age:0s},distance=..3]
scoreboard players operation #search_id simpledrawer.math = @s simpledrawer.id
kill @e[type=armor_stand,tag=simpledrawer.new_drawer.display,predicate=simpledrawer:search_id]
kill @s