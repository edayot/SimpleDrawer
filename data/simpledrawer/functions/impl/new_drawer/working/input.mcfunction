


# Inputs
# A item in storage simpledrawer.io input
# A score #slot simpledrawer.io (-1 for checking all slot) support up to 32 slots in the drawer

# Outputs
# The item in storage simpledrawer.io output
# The 
# The score #success simpledrawer.io for success (-1 for input error, 0 for others error)

scoreboard players set #success simpledrawer.io 0

execute if score #slot simpledrawer.io matches 32.. run scoreboard players set #success simpledrawer.io -1
execute if score #slot simpledrawer.io matches ..-2 run scoreboard players set #success simpledrawer.io -1

execute if score #slot simpledrawer.io matches 0 run function simpledrawer:impl/new_drawer/working/0/input


