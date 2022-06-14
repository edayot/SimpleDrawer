

data modify storage simpledrawer:main temp.dropped_item set from storage simpledrawer:main ItemsNBT.drawer
data modify storage simpledrawer:main temp.dropped_item.tag.BlockEntityTag.Items[0] merge from entity @s Item
data remove storage simpledrawer:main temp.dropped_item.tag.BlockEntityTag.Items[0].tag.display

execute if entity @s[tag=simpledrawer.drawer.filled] run data modify storage simpledrawer:main temp.dropped_item.tag.display.Name set value '{"translate":"simpledrawer.drawer.filled","color":"white","italic":false}'
execute if entity @s[tag=simpledrawer.drawer.filled] run scoreboard players add #model simpledrawer.math 1
execute store result storage simpledrawer:main temp.dropped_item.tag.CustomModelData long 1 run scoreboard players get #model simpledrawer.math

data modify entity @e[type=item,tag=simpledrawer.dropped_item,limit=1,sort=nearest] Item set from storage simpledrawer:main temp.dropped_item
kill @s
