
scoreboard players operation #temp_slot_count simpledrawer.math = @s simpledrawer.new_drawer.slot_count 



scoreboard players set #count_display simpledrawer.math 0

execute store result score #count_display simpledrawer.math run data get entity @s item.components."minecraft:custom_data".simpledrawer.globalCount
execute store result score #maxCount_display simpledrawer.math run data get entity @s item.components."minecraft:custom_data".simpledrawer.maxCount


scoreboard players operation #search_id simpledrawer.math = @s simpledrawer.new_drawer.id

execute if score #noformat simpledrawer.math matches 1 at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.maxcount,limit=1,predicate=simpledrawer:impl/search_id_new_drawer,distance=..10] text set value '[{"score":{"name":"#count_display","objective":"simpledrawer.math"}},{"text":"/"},{"score":{"name":"#maxCount_display","objective":"simpledrawer.math"}}]'

execute unless score #noformat simpledrawer.math matches 1 run function simpledrawer:impl/new_drawer/utils/format_countdisplay_maxcountdisplay
execute unless score #noformat simpledrawer.math matches 1 at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.maxcount,limit=1,predicate=simpledrawer:impl/search_id_new_drawer,distance=..10] text set value '[{"nbt":"temp.count_int","storage":"simpledrawer:main"},{"nbt":"temp.dot","storage":"simpledrawer:main"},{"nbt":"temp.count_reminder","storage":"simpledrawer:main"},{"nbt":"temp.count_suffix","storage":"simpledrawer:main"},{"text":"/"},{"nbt":"temp.maxcount_int","storage":"simpledrawer:main"},{"nbt":"temp.maxdot","storage":"simpledrawer:main"},{"nbt":"temp.maxcount_reminder","storage":"simpledrawer:main"},{"nbt":"temp.maxcount_suffix","storage":"simpledrawer:main"}]'



scoreboard players set #search_slot simpledrawer.math 0
scoreboard players set #count_display simpledrawer.math 0
execute store result score #count_display simpledrawer.math run data get entity @s item.components."minecraft:custom_data".simpledrawer.Items[{Slot:0}].count
execute if score #noformat simpledrawer.math matches 1 at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.text_display,limit=1,predicate=simpledrawer:impl/search_id_slot_new_drawer,distance=..10] text set value '[{"score":{"name":"#count_display","objective":"simpledrawer.math"}}]'

execute unless score #noformat simpledrawer.math matches 1 run function simpledrawer:impl/new_drawer/utils/format_countdisplay
execute unless score #noformat simpledrawer.math matches 1 at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.text_display,limit=1,predicate=simpledrawer:impl/search_id_slot_new_drawer,distance=..10] text set value '[{"nbt":"temp.count_int","storage":"simpledrawer:main"},{"nbt":"temp.dot","storage":"simpledrawer:main"},{"nbt":"temp.count_reminder","storage":"simpledrawer:main"},{"nbt":"temp.count_suffix","storage":"simpledrawer:main"}]'



scoreboard players set #search_slot simpledrawer.math 1
scoreboard players set #count_display simpledrawer.math 0
execute store result score #count_display simpledrawer.math run data get entity @s item.components."minecraft:custom_data".simpledrawer.Items[{Slot:1}].count
execute if score #temp_slot_count simpledrawer.math matches 1 run scoreboard players reset #count_display simpledrawer.math
execute if score #noformat simpledrawer.math matches 1 at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.text_display,limit=1,predicate=simpledrawer:impl/search_id_slot_new_drawer,distance=..10] text set value '[{"score":{"name":"#count_display","objective":"simpledrawer.math"}}]'

execute unless score #noformat simpledrawer.math matches 1 run function simpledrawer:impl/new_drawer/utils/format_countdisplay

execute unless score #noformat simpledrawer.math matches 1 if score #temp_slot_count simpledrawer.math matches 1 run data merge storage simpledrawer:main {temp:{count_int:"",dot:"",count_reminder:"",count_suffix:""}}

execute unless score #noformat simpledrawer.math matches 1 at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.text_display,limit=1,predicate=simpledrawer:impl/search_id_slot_new_drawer,distance=..10] text set value '[{"nbt":"temp.count_int","storage":"simpledrawer:main"},{"nbt":"temp.dot","storage":"simpledrawer:main"},{"nbt":"temp.count_reminder","storage":"simpledrawer:main"},{"nbt":"temp.count_suffix","storage":"simpledrawer:main"}]'

scoreboard players set #search_slot simpledrawer.math 2
scoreboard players set #count_display simpledrawer.math 0
execute store result score #count_display simpledrawer.math run data get entity @s item.components."minecraft:custom_data".simpledrawer.Items[{Slot:2}].count

execute if score #temp_slot_count simpledrawer.math matches 1..2 run scoreboard players reset #count_display simpledrawer.math


execute if score #noformat simpledrawer.math matches 1 at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.text_display,limit=1,predicate=simpledrawer:impl/search_id_slot_new_drawer,distance=..10] text set value '[{"score":{"name":"#count_display","objective":"simpledrawer.math"}}]'

execute unless score #noformat simpledrawer.math matches 1 run function simpledrawer:impl/new_drawer/utils/format_countdisplay

execute unless score #noformat simpledrawer.math matches 1 if score #temp_slot_count simpledrawer.math matches 1..2 run data merge storage simpledrawer:main {temp:{count_int:"",dot:"",count_reminder:"",count_suffix:""}}

execute unless score #noformat simpledrawer.math matches 1 at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.text_display,limit=1,predicate=simpledrawer:impl/search_id_slot_new_drawer,distance=..10] text set value '[{"nbt":"temp.count_int","storage":"simpledrawer:main"},{"nbt":"temp.dot","storage":"simpledrawer:main"},{"nbt":"temp.count_reminder","storage":"simpledrawer:main"},{"nbt":"temp.count_suffix","storage":"simpledrawer:main"}]'




execute at @s as @e[tag=simpledrawer.new_drawer.part.base_block,limit=1,predicate=simpledrawer:impl/search_id_new_drawer,distance=..10] run function simpledrawer:impl/new_drawer/compacting/base_block_display


