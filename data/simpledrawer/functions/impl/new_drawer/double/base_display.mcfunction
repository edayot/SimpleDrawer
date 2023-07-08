

scoreboard players set @s simpledrawer.new_drawer.slot_count 2


execute store result score #count_display simpledrawer.math run data get entity @s item.tag.simpledrawer.globalCount
execute store result score #maxCount_display simpledrawer.math run data get entity @s item.tag.simpledrawer.maxCount


scoreboard players operation #search_id simpledrawer.math = @s simpledrawer.new_drawer.id
execute at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.maxcount,limit=1,predicate=simpledrawer:search_id_new_drawer,distance=..10] text set value '[{"score":{"name":"#count_display","objective":"simpledrawer.math"}},{"text":"/"},{"score":{"name":"#maxCount_display","objective":"simpledrawer.math"}}]'

scoreboard players set #search_slot simpledrawer.math 0
execute store result score #count_display simpledrawer.math run data get entity @s item.tag.simpledrawer.Items[{Slot:0}].Count
execute at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.text_display,limit=1,predicate=simpledrawer:search_id_slot_new_drawer,distance=..10] text set value '[{"score":{"name":"#count_display","objective":"simpledrawer.math"}}]'

scoreboard players set #search_slot simpledrawer.math 1
execute store result score #count_display simpledrawer.math run data get entity @s item.tag.simpledrawer.Items[{Slot:1}].Count
execute at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.text_display,limit=1,predicate=simpledrawer:search_id_slot_new_drawer,distance=..10] text set value '[{"score":{"name":"#count_display","objective":"simpledrawer.math"}}]'




execute at @s as @e[tag=simpledrawer.new_drawer.part.base_block,limit=1,predicate=simpledrawer:search_id_new_drawer,distance=..10] run function simpledrawer:impl/new_drawer/double/base_block_display




