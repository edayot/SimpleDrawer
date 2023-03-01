
#say if item same
data modify storage simpledrawer:io output set from storage simpledrawer:io input
data modify storage simpledrawer:main temp.newItem set from storage simpledrawer:io input


scoreboard players operation #newGlobalCount simpledrawer.math = #globalCount simpledrawer.math 
scoreboard players operation #newGlobalCount simpledrawer.math += #inputCount simpledrawer.math 

execute if score #newGlobalCount simpledrawer.math > #maxCount simpledrawer.math run scoreboard players operation #newGlobalCount simpledrawer.math = #maxCount simpledrawer.math

execute store result score #newCount simpledrawer.math run data get entity @s item.tag.simpledrawer.Items[{Slot:0}].Count
scoreboard players operation #newCount simpledrawer.math += #inputCount simpledrawer.math 
execute if score #newGlobalCount simpledrawer.math = #maxCount simpledrawer.math run scoreboard players operation #newCount simpledrawer.math += #newGlobalCount simpledrawer.math 
execute if score #newGlobalCount simpledrawer.math = #maxCount simpledrawer.math run scoreboard players operation #newCount simpledrawer.math -= #globalCount simpledrawer.math 

# apply new count
execute store result entity @s item.tag.simpledrawer.globalCount int 1 run scoreboard players get #newGlobalCount simpledrawer.math
execute store result storage simpledrawer:main temp.newItem.Count int 1 run scoreboard players get #newCount simpledrawer.math

# apply new item
data modify storage simpledrawer:main temp.newItem.Slot set value 0
data modify entity @s item.tag.simpledrawer.Items[{Slot:0}] set from storage simpledrawer:main temp.newItem

