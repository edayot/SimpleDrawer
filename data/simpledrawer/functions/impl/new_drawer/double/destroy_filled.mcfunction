scoreboard players add #model simpledrawer.math 3


data modify storage simpledrawer:main temp.dropped_item.tag.display.Name set value '{"translate":"simpledrawer.double_new_drawer.filled","color":"white","italic":false}'
data modify storage simpledrawer:main temp.dropped_item.tag.display.Lore set value []

data remove storage simpledrawer:main temp.current_item
data modify storage simpledrawer:main temp.current_item set from storage simpledrawer:main temp.simpledrawer.Items[{Slot:0}]

execute if data storage simpledrawer:main temp.current_item run function simpledrawer:impl/new_drawer/double/destroy_filled_2

data remove storage simpledrawer:main temp.current_item
data modify storage simpledrawer:main temp.current_item set from storage simpledrawer:main temp.simpledrawer.Items[{Slot:1}]

execute if data storage simpledrawer:main temp.current_item run function simpledrawer:impl/new_drawer/double/destroy_filled_2




execute store result score #count simpledrawer.math run data get storage simpledrawer:main temp.simpledrawer.globalCount
execute store result score #maxCount simpledrawer.math run data get storage simpledrawer:main temp.simpledrawer.maxCount


data modify entity 93682a08-d099-4e8f-a4a6-1e33a3692301 HandItems[0] set value {id:"minecraft:stone",Count:1b}
item modify entity 93682a08-d099-4e8f-a4a6-1e33a3692301 weapon.mainhand simpledrawer:impl/destroy_maxcount

data modify storage simpledrawer:main temp.dropped_item.tag.display.Lore append from entity 93682a08-d099-4e8f-a4a6-1e33a3692301 HandItems[0].tag.display.Lore[]


data modify storage simpledrawer:main temp.dropped_item.tag.display.Lore append value '{"translate":"simpledrawer.name","color":"blue","italic":true}'

