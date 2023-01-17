
data modify storage simpledrawer:io input set from storage simpledrawer:main temp.ItemInput

execute as @p[tag=simpledrawer.adder] run function simpledrawer:impl/new_drawer/click/repart/simple_fill/mode

function simpledrawer:impl/new_drawer/click/repart/simple_fill/main


execute if score #success simpledrawer.io matches 1 as @p[tag=simpledrawer.adder] run function simpledrawer:impl/new_drawer/click/repart/simple_fill/delete_item_and_cooldown
