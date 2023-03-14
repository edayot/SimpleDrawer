

say try to compacting

data remove storage simpledrawer:main temp.SelectedItem
execute if score #compacting_type simpledrawer.io matches 1 run data modify storage simpledrawer:main temp.SelectedItem set from storage simpledrawer:io compacting.nugget
execute if score #compacting_type simpledrawer.io matches 2 run data modify storage simpledrawer:main temp.SelectedItem set from storage simpledrawer:io compacting.nugget

execute store result score #count_selected simpledrawer.math run data get storage simpledrawer:io input_compacting.Count

execute if score #compacting_type simpledrawer.io matches 1 run scoreboard players operation #count_selected simpledrawer.math *= #compacting_nugget_in_ingot simpledrawer.io
execute if score #compacting_type simpledrawer.io matches 2 run scoreboard players operation #count_selected simpledrawer.math *= #compacting_nugget_in_block simpledrawer.io

execute store result storage simpledrawer:main temp.SelectedItem.Count int 1 run scoreboard players get #count_selected simpledrawer.math

function simpledrawer:impl/new_drawer/compacting/interaction/interact/compacting

