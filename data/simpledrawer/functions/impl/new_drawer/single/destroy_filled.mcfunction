scoreboard players add #model simpledrawer.math 3


data modify storage simpledrawer:main temp.dropped_item.tag.display.Name set value '{"translate":"simpledrawer.new_drawer.filled","color":"white","italic":false}'





data remove storage simpledrawer:main temp.id
data remove storage simpledrawer:main temp.Name
data modify storage simpledrawer:main temp.id set from storage simpledrawer:main temp.dropped_item.tag.BlockEntityTag.Items[0].tag.simpledrawer.Items[0].id
data modify storage simpledrawer:main temp.Name set from storage simpledrawer:main temp.dropped_item.tag.BlockEntityTag.Items[0].tag.simpledrawer.Items[0].tag.display.Name


data modify entity 93682a08-d099-4e8f-a4a6-1e33a3692301 HandItems[0] set value {id:"minecraft:stone",Count:1b}
data modify entity 93682a08-d099-4e8f-a4a6-1e33a3692301 HandItems[0].id set from storage simpledrawer:main temp.id
execute unless data storage simpledrawer:main temp.Name as 93682a08-d099-4e8f-a4a6-1e33a3692301 run item modify entity @s weapon.mainhand simpledrawer:translate/test_translate
execute if data storage simpledrawer:main temp.Name as 93682a08-d099-4e8f-a4a6-1e33a3692301 run item modify entity @s weapon.mainhand simpledrawer:destroy_display_filled_name

data modify storage simpledrawer:main temp.dropped_item.tag.display.Lore set from entity 93682a08-d099-4e8f-a4a6-1e33a3692301 HandItems[0].tag.display.Lore


