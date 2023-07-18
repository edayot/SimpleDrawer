

data modify storage simpledrawer:main temp.dropped_item set from storage simpledrawer:main ItemsNBT.drawer
data modify storage simpledrawer:main temp.dropped_item.tag.BlockEntityTag.Items[0] merge from entity @s Item
data remove storage simpledrawer:main temp.dropped_item.tag.BlockEntityTag.Items[0].tag.display


scoreboard players set #count simpledrawer.math 0
scoreboard players operation #count simpledrawer.math = @s simpledrawer.drawer.Count
scoreboard players operation #maxCount simpledrawer.math = @s simpledrawer.drawer.maxCount

data remove entity @s Item.tag.display
item modify entity @s container.0 simpledrawer:impl/destroy_display
data modify storage simpledrawer:main temp.dropped_item.tag.display.Lore set from entity @s Item.tag.display.Lore

execute if entity @s[tag=simpledrawer.drawer.filled] run function simpledrawer:impl/drawer/destroy_item_filled
execute store result storage simpledrawer:main temp.dropped_item.tag.CustomModelData int 1 run scoreboard players get #model simpledrawer.math






data modify entity @e[type=item,tag=simpledrawer.dropped_item,limit=1,sort=nearest] Item set from storage simpledrawer:main temp.dropped_item
kill @s
