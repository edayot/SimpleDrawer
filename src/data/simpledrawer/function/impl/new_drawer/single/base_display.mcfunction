

scoreboard players set @s simpledrawer.new_drawer.slot_count 1

data remove storage simpledrawer:main temp.simpledrawer_display
data modify storage simpledrawer:main temp.simpledrawer_display set from entity @s item.components."minecraft:custom_data".simpledrawer


scoreboard players set #count_display simpledrawer.math 0
execute store result score #count_display simpledrawer.math run data get storage simpledrawer:main temp.simpledrawer_display.globalCount
execute store result score #maxCount_display simpledrawer.math run data get storage simpledrawer:main temp.simpledrawer_display.maxCount


scoreboard players operation #search_id simpledrawer.math = @s simpledrawer.new_drawer.id
scoreboard players set #search_slot simpledrawer.math 0

execute if score @s simpledrawer.new_drawer.no_format_cooldown matches 1.. at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.text_display,limit=1,predicate=simpledrawer:impl/search_id_slot_new_drawer,distance=..10] text set value [{"score":{"name":"#count_display","objective":"simpledrawer.math"}},{"text":"/"},{"score":{"name":"#maxCount_display","objective":"simpledrawer.math"}}]


execute unless score @s simpledrawer.new_drawer.no_format_cooldown matches 1.. run function simpledrawer:impl/new_drawer/utils/format_countdisplay_maxcountdisplay
execute unless score @s simpledrawer.new_drawer.no_format_cooldown matches 1.. at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.text_display,limit=1,predicate=simpledrawer:impl/search_id_slot_new_drawer,distance=..10] text set value [{"nbt":"temp.count_int","storage":"simpledrawer:main"},{"nbt":"temp.dot","storage":"simpledrawer:main"},{"nbt":"temp.count_reminder","storage":"simpledrawer:main"},{"nbt":"temp.count_suffix","storage":"simpledrawer:main"},{"text":"/"},{"nbt":"temp.maxcount_int","storage":"simpledrawer:main"},{"nbt":"temp.maxdot","storage":"simpledrawer:main"},{"nbt":"temp.maxcount_reminder","storage":"simpledrawer:main"},{"nbt":"temp.maxcount_suffix","storage":"simpledrawer:main"}]





