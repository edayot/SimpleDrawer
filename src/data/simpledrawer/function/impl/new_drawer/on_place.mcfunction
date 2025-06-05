# @public

execute if score simpledrawer load.status matches 1 if data storage smithed.custom_block:main {blockApi:{id:"simpledrawer:new_drawer"}} run function simpledrawer:impl/new_drawer/place_version


execute 
    unless score simpledrawer load.status matches 1 
    if data storage smithed.custom_block:main {blockApi:{id:"simpledrawer:new_drawer"}} 
    run function ./modify_place:
        execute store result block ~ ~ ~ components."minecraft:custom_data".simpledrawer_failure int 1 run time query gametime


