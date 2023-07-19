scoreboard players add #model simpledrawer.math 3


data modify storage simpledrawer:main temp.dropped_item.tag.display.Name set value '{"translate":"simpledrawer.new_drawer.filled","color":"white","italic":false}'


execute store result score #count simpledrawer.math run data get storage simpledrawer:main temp.simpledrawer.Items[0].Count
execute store result score #maxCount simpledrawer.math run data get storage simpledrawer:main temp.simpledrawer.maxCount


data remove storage simpledrawer:main temp.id
data remove storage simpledrawer:main temp.Name
data modify storage simpledrawer:main temp.id set from storage simpledrawer:main temp.simpledrawer.Items[0].id
data modify storage simpledrawer:main temp.Name set from storage simpledrawer:main temp.simpledrawer.Items[0].tag.display.Name


data modify entity 93682a08-d099-4e8f-a4a6-1e33a3692301 HandItems[0] set value {id:"minecraft:stone",Count:1b}
data modify entity 93682a08-d099-4e8f-a4a6-1e33a3692301 HandItems[0].id set from storage simpledrawer:main temp.id
execute unless data storage simpledrawer:main temp.Name as 93682a08-d099-4e8f-a4a6-1e33a3692301 run item modify entity @s weapon.mainhand simpledrawer:impl/translate/test_translate
execute if data storage simpledrawer:main temp.Name as 93682a08-d099-4e8f-a4a6-1e33a3692301 run item modify entity @s weapon.mainhand simpledrawer:impl/destroy_display_filled_name

data modify storage simpledrawer:main temp.dropped_item.tag.display.Lore set from entity 93682a08-d099-4e8f-a4a6-1e33a3692301 HandItems[0].tag.display.Lore


