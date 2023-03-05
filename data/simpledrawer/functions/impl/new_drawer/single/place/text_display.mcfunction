



tag @s add simpledrawer.new_drawer.part
tag @s add simpledrawer.new_drawer.part.text_display

scoreboard players operation @s simpledrawer.new_drawer.id = #global simpledrawer.new_drawer.id
scoreboard players operation @s simpledrawer.new_drawer.part_id = #part_index simpledrawer.new_drawer.part_id


tp @s ~ ~ ~ ~ ~

execute store result score #newCount simpledrawer.math run data get storage simpledrawer:main temp.item_stored.Count
execute store result score #newCount simpledrawer.math run data get storage simpledrawer:main temp.item_stored.Count

data modify entity @s text set value '[{"score":{"name":"#newCount","objective":"simpledrawer.math"}},{"text":"/"},{"score":{"name":"#maxCount","objective":"simpledrawer.math"}}]'

data merge entity @s {transformation:{scale:[0.4f,0.4f,0.4f]},background:0}

