data modify storage simpledrawer:main temp.dropped_item.tag.display.Name set value '{"translate":"simpledrawer.drawer.filled","color":"white","italic":false}'
execute if entity @s[tag=simpledrawer.drawer.filled] run scoreboard players add #model simpledrawer.math 1
data remove storage simpledrawer:main temp.id
data remove storage simpledrawer:main temp.Name
data modify storage simpledrawer:main temp.id set from storage simpledrawer:main temp.dropped_item.tag.BlockEntityTag.Items[0].tag.simpledrawer.Item.id
data modify storage simpledrawer:main temp.Name set from storage simpledrawer:main temp.dropped_item.tag.BlockEntityTag.Items[0].tag.simpledrawer.Item.tag.display.Name



data remove entity @s Item.tag.display
execute unless data storage simpledrawer:main temp.Name run item modify entity @s container.0 simpledrawer:destroy_display_filled_id
execute if data storage simpledrawer:main temp.Name run item modify entity @s container.0 simpledrawer:destroy_display_filled_name

data modify storage simpledrawer:main temp.dropped_item.tag.display.Lore set from entity @s Item.tag.display.Lore