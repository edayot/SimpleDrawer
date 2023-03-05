
scoreboard players set #success simpledrawer.io 1

data modify storage simpledrawer:io output set from storage simpledrawer:io input


scoreboard players operation #newGlobalCount simpledrawer.math = #globalCount simpledrawer.math 
scoreboard players operation #newGlobalCount simpledrawer.math += #inputCount simpledrawer.math 

execute if score #newGlobalCount simpledrawer.math > #maxCount simpledrawer.math run scoreboard players operation #newGlobalCount simpledrawer.math = #maxCount simpledrawer.math

execute store result score #initCount simpledrawer.math run data get entity @s item.tag.simpledrawer.Items[{Slot:19}].Count
scoreboard players operation #newCount simpledrawer.math = #initCount simpledrawer.math 
scoreboard players operation #newCount simpledrawer.math += #inputCount simpledrawer.math 

execute if score #newGlobalCount simpledrawer.math > #maxCount simpledrawer.math run function simpledrawer:impl/new_drawer/working/io/19/input/over


# apply new count
execute store result entity @s item.tag.simpledrawer.globalCount int 1 run scoreboard players get #newGlobalCount simpledrawer.math
execute store result entity @s item.tag.simpledrawer.Items[{Slot:19}].Count int 1 run scoreboard players get #newCount simpledrawer.math

scoreboard players operation #count_insert simpledrawer.io = #newCount simpledrawer.math
scoreboard players operation #count_insert simpledrawer.io -= #initCount simpledrawer.math

scoreboard players operation #search_id simpledrawer.math = @s simpledrawer.new_drawer.id
scoreboard players set #search_slot simpledrawer.math 0
execute at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.text_display,limit=1,predicate=simpledrawer:search_id_slot_new_drawer,distance=..10] text set value '[{"score":{"name":"#newCount","objective":"simpledrawer.math"}},{"text":"/"},{"score":{"name":"#maxCount","objective":"simpledrawer.math"}}]'


