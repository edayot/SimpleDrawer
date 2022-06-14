data modify storage simpledrawer:main temp.dropped_item.tag.display.Name set value '{"translate":"simpledrawer.drawer.filled","color":"white","italic":false}'
execute if entity @s[tag=simpledrawer.drawer.filled] run scoreboard players add #model simpledrawer.math 1
data remove storage simpledrawer:main temp.id 
data modify storage simpledrawer:main temp.id set from storage simpledrawer:main temp.dropped_item.tag.BlockEntityTag.Items[0].tag.simpledrawer.Item.id

data remove entity @s Item.tag.display
item modify entity @s container.0 simpledrawer:destroy_display

data modify storage simpledrawer:main temp.dropped_item.tag.display.Lore set from entity @s Item.tag.display.Lore