

scoreboard players set #success simpledrawer.io 1


data modify storage simpledrawer:io output set from entity @s item.tag.simpledrawer.Items[{Slot:21}]
execute store result storage simpledrawer:io output.Count int 1 run scoreboard players get #count simpledrawer.io
scoreboard players operation #count_output simpledrawer.io = #count simpledrawer.io

scoreboard players operation #newCount simpledrawer.math = #initCount simpledrawer.math
scoreboard players operation #newCount simpledrawer.math -= #count simpledrawer.io

scoreboard players operation #newGlobalCount simpledrawer.math = #globalCount simpledrawer.math
scoreboard players operation #newGlobalCount simpledrawer.math -= #count simpledrawer.io

execute store result entity @s item.tag.simpledrawer.globalCount int 1 run scoreboard players get #newGlobalCount simpledrawer.math


execute store result entity @s item.tag.simpledrawer.Items[{Slot:21}].Count int 1 run scoreboard players get #newCount simpledrawer.math
scoreboard players operation #search_id simpledrawer.math = @s simpledrawer.new_drawer.id
scoreboard players set #search_slot simpledrawer.math 21
execute at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.text_display,limit=1,predicate=simpledrawer:search_id_slot_new_drawer,distance=..10] text set value '[{"score":{"name":"#newCount","objective":"simpledrawer.math"}},{"text":"/"},{"score":{"name":"#maxCount","objective":"simpledrawer.math"}}]'




