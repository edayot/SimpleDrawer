# @to_update
# For newer version it will upgrade the drawer and then place it
# changes as to be made on storage smithed.custom_block:main blockApi.__data.Items[0].components."minecraft:custom_data".simpledrawer

# nothing from 1.9.0 to 1.9.1
# nothing from 1.9.1 to 1.9.2



# store the new_drawer version automaticly
execute store result storage smithed.custom_block:main blockApi.__data.Items[0].components."minecraft:custom_data".simpledrawer.version.major int 1 run scoreboard players get #simpledrawer.major load.status
execute store result storage smithed.custom_block:main blockApi.__data.Items[0].components."minecraft:custom_data".simpledrawer.version.minor int 1 run scoreboard players get #simpledrawer.minor load.status
execute store result storage smithed.custom_block:main blockApi.__data.Items[0].components."minecraft:custom_data".simpledrawer.version.patch int 1 run scoreboard players get #simpledrawer.patch load.status


function simpledrawer:impl/new_drawer/place

