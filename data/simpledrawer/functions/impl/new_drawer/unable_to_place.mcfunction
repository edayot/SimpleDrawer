# @to_update
# For newer version it will upgrade the drawer and then place it
# changes as to be made on storage smithed.custom_block:main blockApi.__data.Items[0].components."minecraft:custom_data".simpledrawer

# nothing from 1.9.0 to 1.9.1
# nothing from 1.9.1 to 1.9.2



# store the new_drawer version automaticly
execute
    if score #drawer.major simpledrawer.math matches 2..
    run function simpledrawer:impl/new_drawer/place

