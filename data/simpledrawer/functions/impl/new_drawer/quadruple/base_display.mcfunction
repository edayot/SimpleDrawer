

scoreboard players set @s simpledrawer.new_drawer.slot_count 4


execute store result score #globalcount_display simpledrawer.math run data get entity @s item.tag.simpledrawer.globalCount
execute store result score #maxCount_display simpledrawer.math run data get entity @s item.tag.simpledrawer.maxCount


scoreboard players operation #search_id simpledrawer.math = @s simpledrawer.new_drawer.id
execute at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.maxcount,limit=1,predicate=simpledrawer:search_id_new_drawer,distance=..10] text set value '[{"score":{"name":"#globalcount_display","objective":"simpledrawer.math"}},{"text":"/"},{"score":{"name":"#maxCount_display","objective":"simpledrawer.math"}}]'




scoreboard players set #search_slot simpledrawer.math 0
execute store result score #count_display simpledrawer.math run data get entity @s item.tag.simpledrawer.Items[{Slot:0}].Count
execute at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.text_display,limit=1,predicate=simpledrawer:search_id_slot_new_drawer,distance=..10] text set value '[{"score":{"name":"#count_display","objective":"simpledrawer.math"}}]'

scoreboard players set #search_slot simpledrawer.math 1
execute store result score #count_display simpledrawer.math run data get entity @s item.tag.simpledrawer.Items[{Slot:1}].Count
execute at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.text_display,limit=1,predicate=simpledrawer:search_id_slot_new_drawer,distance=..10] text set value '[{"score":{"name":"#count_display","objective":"simpledrawer.math"}}]'

scoreboard players set #search_slot simpledrawer.math 2
execute store result score #count_display simpledrawer.math run data get entity @s item.tag.simpledrawer.Items[{Slot:2}].Count
execute at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.text_display,limit=1,predicate=simpledrawer:search_id_slot_new_drawer,distance=..10] text set value '[{"score":{"name":"#count_display","objective":"simpledrawer.math"}}]'

scoreboard players set #search_slot simpledrawer.math 3
execute store result score #count_display simpledrawer.math run data get entity @s item.tag.simpledrawer.Items[{Slot:3}].Count
execute at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.text_display,limit=1,predicate=simpledrawer:search_id_slot_new_drawer,distance=..10] text set value '[{"score":{"name":"#count_display","objective":"simpledrawer.math"}}]'




data modify entity @s item.tag.Trim set value {material:"simpledrawer:acacia",pattern:"minecraft:sentry"}
data modify entity @s item.tag.Trim.material set from storage simpledrawer:main temp.simpledrawerXX.wood_type


data modify entity @s item.tag.CustomModelData set value 1430002

