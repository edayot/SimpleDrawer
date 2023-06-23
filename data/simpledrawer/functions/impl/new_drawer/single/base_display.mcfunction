




execute store result score #count_display simpledrawer.math run data get entity @s item.tag.simpledrawer.globalCount
execute store result score #maxCount_display simpledrawer.math run data get entity @s item.tag.simpledrawer.maxCount


scoreboard players operation #search_id simpledrawer.math = @s simpledrawer.new_drawer.id
scoreboard players set #search_slot simpledrawer.math 0

execute at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.text_display,limit=1,predicate=simpledrawer:search_id_slot_new_drawer,distance=..10] text set value '[{"score":{"name":"#count_display","objective":"simpledrawer.math"}},{"text":"/"},{"score":{"name":"#maxCount_display","objective":"simpledrawer.math"}}]'

data modify storage simpledrawer:main temp.hopper set from entity @s item.tag.simpledrawer.hopper
data modify storage simpledrawer:main temp.upgrade set from entity @s item.tag.simpledrawer.upgrade


scoreboard players set #model simpledrawer.math 1430000
execute if data storage simpledrawer:main temp{hopper:1b} run scoreboard players add #model simpledrawer.math 2
execute if data storage simpledrawer:main temp{upgrade:"iron"} run scoreboard players add #model simpledrawer.math 4
execute if data storage simpledrawer:main temp{upgrade:"gold"} run scoreboard players add #model simpledrawer.math 8
execute if data storage simpledrawer:main temp{upgrade:"diamond"} run scoreboard players add #model simpledrawer.math 12
execute if data storage simpledrawer:main temp{upgrade:"star"} run scoreboard players add #model simpledrawer.math 16
execute if data storage simpledrawer:main temp{upgrade:"netherite"} run scoreboard players add #model simpledrawer.math 20

scoreboard players set #model simpledrawer.math 1430200

execute store result entity @s item.tag.CustomModelData int 1 run scoreboard players get #model simpledrawer.math

