# @public

execute if score simpledrawer load.status matches 1 if data storage smithed.custom_block:main {blockApi:{id:"simpledrawer:new_drawer"}} run function simpledrawer:impl/new_drawer/place
