data modify storage simpledrawer:main temp.dropped_item.tag.display.Name set value '{"translate":"simpledrawer.drawer.filled","color":"white","italic":false}'
execute if entity @s[tag=simpledrawer.drawer.filled] run scoreboard players add #model simpledrawer.math 1
data remove storage simpledrawer:main temp.id
data remove storage simpledrawer:main temp.Name
data modify storage simpledrawer:main temp.id set from storage simpledrawer:main temp.dropped_item.tag.BlockEntityTag.Items[0].tag.simpledrawer.Item.id
data modify storage simpledrawer:main temp.Name set from storage simpledrawer:main temp.dropped_item.tag.BlockEntityTag.Items[0].tag.simpledrawer.Item.tag.display.Name


data modify entity 00022e98-0000-0378-0000-037800000058 HandItems[0] set value {id:"minecraft:stone",Count:1b}
data modify entity 00022e98-0000-0378-0000-037800000058 HandItems[0].id set from storage simpledrawer:main temp.id
execute unless data storage simpledrawer:main temp.Name as 00022e98-0000-0378-0000-037800000058 run item modify entity @s weapon.mainhand simpledrawer:translate/test_translate
execute if data storage simpledrawer:main temp.Name as 00022e98-0000-0378-0000-037800000058 run item modify entity @s weapon.mainhand simpledrawer:destroy_display_filled_name

data modify storage simpledrawer:main temp.dropped_item.tag.display.Lore set from entity 00022e98-0000-0378-0000-037800000058 HandItems[0].tag.display.Lore