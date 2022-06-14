

data modify storage simpledrawer:main temp.dropped_item set from storage simpledrawer:main ItemsNBT.drawer
data modify storage simpledrawer:main temp.dropped_item.tag.BlockEntityTag.Items[0] merge from entity @s Item
data remove storage simpledrawer:main temp.dropped_item.tag.BlockEntityTag.Items[0].tag.display


scoreboard players set #count simpledrawer.math 0
execute store result score #count simpledrawer.math run data get entity @s Item.tag.simpledrawer.Item.Count
scoreboard players operation #maxCount simpledrawer.math = @s simpledrawer.drawer.maxCount


execute if entity @s[tag=simpledrawer.drawer.filled] run function simpledrawer:drawer/destroy_item_filled
execute store result storage simpledrawer:main temp.dropped_item.tag.CustomModelData long 1 run scoreboard players get #model simpledrawer.math






data modify entity @e[type=item,tag=simpledrawer.dropped_item,limit=1,sort=nearest] Item set from storage simpledrawer:main temp.dropped_item
kill @s
