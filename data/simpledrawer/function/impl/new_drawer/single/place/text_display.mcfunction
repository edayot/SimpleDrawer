



tag @s add global.ignore
tag @s add simpledrawer.new_drawer.part
tag @s add simpledrawer.new_drawer.part.text_display

tag @s add smithed.entity
tag @s add smithed.strict

scoreboard players operation @s simpledrawer.new_drawer.id = #place_id simpledrawer.math
scoreboard players operation @s simpledrawer.new_drawer.part_id = #part_index simpledrawer.new_drawer.part_id


tp @s ~ ~ ~ ~ ~

execute store result score #newCount simpledrawer.math run data get storage simpledrawer:main temp.item_stored.count

data modify entity @s text set value '[{"score":{"name":"#newCount","objective":"simpledrawer.math"}},{"text":"/"},{"score":{"name":"#maxCount","objective":"simpledrawer.math"}}]'

data merge entity @s {transformation:{scale:[0.4f,0.4f,0.4f]},background:0}

