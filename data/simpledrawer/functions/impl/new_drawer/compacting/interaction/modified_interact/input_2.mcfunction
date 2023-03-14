execute store result score #countItem_comp simpledrawer.math run data get storage simpledrawer:io input.Count
scoreboard players set #count_input simpledrawer.math 1


execute if score #compacting_type simpledrawer.io matches 1 run scoreboard players operation #count_input simpledrawer.math = #compacting_nugget_in_ingot simpledrawer.io

# #A=[(maxCount-globalCount)%/#compacting_nugget_in_ingot]
execute if score #compacting_type simpledrawer.io matches 1 if score #ifsneak simpledrawer.math matches 1 run scoreboard players operation #count_input simpledrawer.math = #countItem_comp simpledrawer.math
execute if score #compacting_type simpledrawer.io matches 1 store result score #globalCount_compacting simpledrawer.math run data get entity @s item.tag.simpledrawer.globalCount
execute if score #compacting_type simpledrawer.io matches 1 store result score #maxCount_compacting simpledrawer.math run data get entity @s item.tag.simpledrawer.maxCount
execute if score #compacting_type simpledrawer.io matches 1 run scoreboard players operation #A simpledrawer.math = #maxCount_compacting simpledrawer.math
execute if score #compacting_type simpledrawer.io matches 1 run scoreboard players operation #A simpledrawer.math -= #globalCount_compacting simpledrawer.math

execute if score #compacting_type simpledrawer.io matches 1 if score #count_input simpledrawer.math >= #A simpledrawer.math run function simpledrawer:impl/new_drawer/compacting/interaction/modified_interact/input_21

execute if score #compacting_type simpledrawer.io matches 2 run scoreboard players operation #count_input simpledrawer.math = #compacting_nugget_in_block simpledrawer.io

# #A=[(maxCount-globalCount)%/#compacting_nugget_in_ingot]
execute if score #compacting_type simpledrawer.io matches 2 if score #ifsneak simpledrawer.math matches 1 run scoreboard players operation #count_input simpledrawer.math = #countItem_comp simpledrawer.math
execute if score #compacting_type simpledrawer.io matches 2 store result score #globalCount_compacting simpledrawer.math run data get entity @s item.tag.simpledrawer.globalCount
execute if score #compacting_type simpledrawer.io matches 2 store result score #maxCount_compacting simpledrawer.math run data get entity @s item.tag.simpledrawer.maxCount
execute if score #compacting_type simpledrawer.io matches 2 run scoreboard players operation #A simpledrawer.math = #maxCount_compacting simpledrawer.math
execute if score #compacting_type simpledrawer.io matches 2 run scoreboard players operation #A simpledrawer.math -= #globalCount_compacting simpledrawer.math

execute if score #compacting_type simpledrawer.io matches 2 if score #count_input simpledrawer.math >= #A simpledrawer.math run function simpledrawer:impl/new_drawer/compacting/interaction/modified_interact/input_22

execute store result storage simpledrawer:io input.Count int 1 run scoreboard players get #count_input simpledrawer.math

function simpledrawer:impl/new_drawer/working/io/input
