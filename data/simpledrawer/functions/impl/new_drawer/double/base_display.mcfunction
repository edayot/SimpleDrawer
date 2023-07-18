

scoreboard players set @s simpledrawer.new_drawer.slot_count 2


execute store result score #count_display simpledrawer.math run data get entity @s item.tag.simpledrawer.globalCount
execute store result score #maxCount_display simpledrawer.math run data get entity @s item.tag.simpledrawer.maxCount


scoreboard players operation #search_id simpledrawer.math = @s simpledrawer.new_drawer.id
execute if score #noformat simpledrawer.math matches 1 at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.maxcount,limit=1,predicate=simpledrawer:impl/search_id_new_drawer,distance=..10] text set value '[{"score":{"name":"#count_display","objective":"simpledrawer.math"}},{"text":"/"},{"score":{"name":"#maxCount_display","objective":"simpledrawer.math"}}]'

execute if score #noformat simpledrawer.math matches 0 run function simpledrawer:impl/new_drawer/utils/format_countdisplay_maxcountdisplay
execute if score #noformat simpledrawer.math matches 0 at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.maxcount,limit=1,predicate=simpledrawer:impl/search_id_new_drawer,distance=..10] text set value '[{"nbt":"temp.count_int","storage":"simpledrawer:main"},{"nbt":"temp.dot","storage":"simpledrawer:main"},{"nbt":"temp.count_reminder","storage":"simpledrawer:main"},{"nbt":"temp.count_suffix","storage":"simpledrawer:main"},{"text":"/"},{"nbt":"temp.maxcount_int","storage":"simpledrawer:main"},{"nbt":"temp.maxdot","storage":"simpledrawer:main"},{"nbt":"temp.maxcount_reminder","storage":"simpledrawer:main"},{"nbt":"temp.maxcount_suffix","storage":"simpledrawer:main"}]'

scoreboard players set #search_slot simpledrawer.math 0
execute store result score #count_display simpledrawer.math run data get entity @s item.tag.simpledrawer.Items[{Slot:0}].Count
execute if score #noformat simpledrawer.math matches 1 at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.text_display,limit=1,predicate=simpledrawer:impl/search_id_slot_new_drawer,distance=..10] text set value '[{"score":{"name":"#count_display","objective":"simpledrawer.math"}}]'

execute if score #noformat simpledrawer.math matches 0 run function simpledrawer:impl/new_drawer/utils/format_countdisplay
execute if score #noformat simpledrawer.math matches 1 at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.text_display,limit=1,predicate=simpledrawer:impl/search_id_slot_new_drawer,distance=..10] text set value '[{"nbt":"temp.count_int","storage":"simpledrawer:main"},{"nbt":"temp.dot","storage":"simpledrawer:main"},{"nbt":"temp.count_reminder","storage":"simpledrawer:main"},{"nbt":"temp.count_suffix","storage":"simpledrawer:main"}]'

scoreboard players set #search_slot simpledrawer.math 1
execute store result score #count_display simpledrawer.math run data get entity @s item.tag.simpledrawer.Items[{Slot:1}].Count
execute if score #noformat simpledrawer.math matches 1 at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.text_display,limit=1,predicate=simpledrawer:impl/search_id_slot_new_drawer,distance=..10] text set value '[{"score":{"name":"#count_display","objective":"simpledrawer.math"}}]'

execute if score #noformat simpledrawer.math matches 0 run function simpledrawer:impl/new_drawer/utils/format_countdisplay
execute if score #noformat simpledrawer.math matches 1 at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.text_display,limit=1,predicate=simpledrawer:impl/search_id_slot_new_drawer,distance=..10] text set value '[{"nbt":"temp.count_int","storage":"simpledrawer:main"},{"nbt":"temp.dot","storage":"simpledrawer:main"},{"nbt":"temp.count_reminder","storage":"simpledrawer:main"},{"nbt":"temp.count_suffix","storage":"simpledrawer:main"}]'




execute at @s as @e[tag=simpledrawer.new_drawer.part.base_block,limit=1,predicate=simpledrawer:impl/search_id_new_drawer,distance=..10] run function simpledrawer:impl/new_drawer/double/base_block_display




