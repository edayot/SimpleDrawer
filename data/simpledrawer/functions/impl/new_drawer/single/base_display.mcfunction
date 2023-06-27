

scoreboard players set @s simpledrawer.new_drawer.slot_count 1


execute store result score #count_display simpledrawer.math run data get entity @s item.tag.simpledrawer.globalCount
execute store result score #maxCount_display simpledrawer.math run data get entity @s item.tag.simpledrawer.maxCount


scoreboard players operation #search_id simpledrawer.math = @s simpledrawer.new_drawer.id
scoreboard players set #search_slot simpledrawer.math 0

execute at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.text_display,limit=1,predicate=simpledrawer:search_id_slot_new_drawer,distance=..10] text set value '[{"score":{"name":"#count_display","objective":"simpledrawer.math"}},{"text":"/"},{"score":{"name":"#maxCount_display","objective":"simpledrawer.math"}}]'



data modify entity @s item.tag.Trim set value {material:"simpledrawer:acacia",pattern:"minecraft:sentry"}
data modify entity @s item.tag.Trim.material set from storage simpledrawer:main temp.simpledrawerXX.wood_type


data modify entity @s item.tag.CustomModelData set value 1430000

