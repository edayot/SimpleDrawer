



tag @s add simpledrawer.new_drawer.part
tag @s add simpledrawer.new_drawer.part.maxcount

scoreboard players operation @s simpledrawer.new_drawer.id = #global simpledrawer.new_drawer.id


tp @s ~ ~ ~ ~ ~

execute store result score #globalCount simpledrawer.math run data get storage simpledrawer:main temp.simpledrawer.globalCount

data modify entity @s text set value '[{"score":{"name":"#globalCount","objective":"simpledrawer.math"}},{"text":"/"},{"score":{"name":"#maxCount","objective":"simpledrawer.math"}}]'




data merge entity @s {transformation:{scale:[0.2f,0.2f,0.2f]},background:0}
