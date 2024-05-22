

scoreboard players set #success simpledrawer.io 1
scoreboard players set #modified_slot simpledrawer.io 3


data modify storage simpledrawer:io output set from storage simpledrawer:io input
data modify storage simpledrawer:main temp.newItem set from storage simpledrawer:io input


scoreboard players operation #newGlobalCount simpledrawer.math = #globalCount simpledrawer.math 
scoreboard players operation #newGlobalCount simpledrawer.math += #inputCount simpledrawer.math 

scoreboard players operation #newCount simpledrawer.math = #inputCount simpledrawer.math 


execute if score #newGlobalCount simpledrawer.math > #maxCount simpledrawer.math run function simpledrawer:impl/new_drawer/working/io/3/input/over



# apply new count
execute store result entity @s item.components."minecraft:custom_data".simpledrawer.globalCount int 1 run scoreboard players get #newGlobalCount simpledrawer.math
execute store result storage simpledrawer:main temp.newItem.count int 1 run scoreboard players get #newCount simpledrawer.math
scoreboard players operation #count_insert simpledrawer.io = #newCount simpledrawer.math

# apply new item
data modify storage simpledrawer:main temp.newItem.Slot set value 3
data modify entity @s item.components."minecraft:custom_data".simpledrawer.Items append from storage simpledrawer:main temp.newItem

#display
scoreboard players operation #search_id simpledrawer.math = @s simpledrawer.new_drawer.id
scoreboard players set #search_slot simpledrawer.math 3
data modify storage simpledrawer:main temp.newItem.count set value 1b
execute at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.item_display,limit=1,predicate=simpledrawer:impl/search_id_slot_new_drawer,distance=..10] item set from storage simpledrawer:main temp.newItem
