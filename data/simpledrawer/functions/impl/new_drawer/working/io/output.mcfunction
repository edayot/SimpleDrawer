# Inputs
# Take #count simpledrawer.io as input

# A score #slot simpledrawer.io (-1 for checking all slot) support up to 32 slots in the drawer

# Outputs
# The item in storage simpledrawer.io output
# The 
# The score #success simpledrawer.io for success (-2 for full error, -1 for input error, 0 for others error)

scoreboard players set #success simpledrawer.io 0
data remove storage simpledrawer:io output



execute if score #slot simpledrawer.io matches 32.. run scoreboard players set #success simpledrawer.io -1
execute if score #slot simpledrawer.io matches ..-2 run scoreboard players set #success simpledrawer.io -1

execute if score #count simpledrawer.io matches ..0 run scoreboard players set #success simpledrawer.io -1

execute store result score #globalCount simpledrawer.math run data get entity @s item.tag.simpledrawer.globalCount


execute unless score #success simpledrawer.io matches ..-1 run function simpledrawer:impl/new_drawer/working/io/output_check 

