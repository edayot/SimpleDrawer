


# Inputs
# A item in storage simpledrawer.io input
# A score #slot simpledrawer.io (-1 for checking all slot) support up to 32 slots in the drawer

# Outputs
# The item in storage simpledrawer.io output
# The 
# The score #success simpledrawer.io for success (-2 for full error, -1 for input error, 0 for others error)
# say INPUT
scoreboard players set #success simpledrawer.io 0
data remove storage simpledrawer:io output

execute if score #slot simpledrawer.io matches 32.. run scoreboard players set #success simpledrawer.io -1
execute if score #slot simpledrawer.io matches ..-2 run scoreboard players set #success simpledrawer.io -1

scoreboard players set #good_item simpledrawer.math 1
function #simpledrawer:disabled_input


execute store result score #inputCount simpledrawer.math run data get storage simpledrawer:io input.Count
execute store result score #maxCount simpledrawer.math run data get entity @s item.tag.simpledrawer.maxCount
execute store result score #globalCount simpledrawer.math run data get entity @s item.tag.simpledrawer.globalCount

execute if score #globalCount simpledrawer.math >= #maxCount simpledrawer.math run scoreboard players set #success simpledrawer.io -2

execute if score #good_item simpledrawer.math matches 1 unless score #success simpledrawer.io matches ..-1 unless score #slot simpledrawer.io matches -1 run function simpledrawer:impl/new_drawer/working/io/input_check
execute if score #good_item simpledrawer.math matches 1 unless score #success simpledrawer.io matches ..-1 if score #slot simpledrawer.io matches -1 run function simpledrawer:impl/new_drawer/working/io/input_all


function simpledrawer:impl/new_drawer/base_display

