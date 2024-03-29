

scoreboard players set #success simpledrawer.io 1
scoreboard players set #modified_slot simpledrawer.io 6



data modify storage simpledrawer:io output set from entity @s item.tag.simpledrawer.Items[{Slot:6}]
execute store result storage simpledrawer:io output.Count int 1 run scoreboard players get #initCount simpledrawer.math
scoreboard players operation #count_output simpledrawer.io = #initCount simpledrawer.math


scoreboard players operation #newGlobalCount simpledrawer.math = #globalCount simpledrawer.math
scoreboard players operation #newGlobalCount simpledrawer.math -= #initCount simpledrawer.math

execute store result entity @s item.tag.simpledrawer.globalCount int 1 run scoreboard players get #newGlobalCount simpledrawer.math


data remove entity @s item.tag.simpledrawer.Items[{Slot:6}]

scoreboard players operation #search_id simpledrawer.math = @s simpledrawer.new_drawer.id
scoreboard players set #search_slot simpledrawer.math 6
scoreboard players set #newCount simpledrawer.math 0
execute at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.item_display,limit=1,predicate=simpledrawer:impl/search_id_slot_new_drawer,distance=..10] item set value {id:"minecraft:air",Count:1b}

