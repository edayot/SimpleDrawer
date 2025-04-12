



tag @s add global.ignore
tag @s add simpledrawer.new_drawer.part
tag @s add simpledrawer.new_drawer.part.maxcount


tag @s add smithed.entity
tag @s add smithed.strict

scoreboard players operation @s simpledrawer.new_drawer.id = #place_id simpledrawer.math


tp @s ~ ~ ~ ~ ~

execute store result score #globalCount simpledrawer.math run data get storage simpledrawer:main temp.simpledrawer.globalCount

data modify entity @s text set value [{"score":{"name":"#globalCount","objective":"simpledrawer.math"}},{"text":"/"},{"score":{"name":"#maxCount","objective":"simpledrawer.math"}}]




data merge entity @s {transformation:{scale:[0.2f,0.2f,0.2f]},background:0}

