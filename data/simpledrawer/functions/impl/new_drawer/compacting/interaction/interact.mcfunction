


data remove storage simpledrawer:io input_compacting
data modify storage simpledrawer:io input_compacting set from entity @s SelectedItem
scoreboard players set #success_compacting simpledrawer.io 0
function #simpledrawer:compacting

scoreboard players set #if_try_compacting simpledrawer.math 0
execute if score #success_compacting simpledrawer.io matches 0 run function simpledrawer:impl/new_drawer/compacting/interaction/interact/normal
execute if score #success_compacting simpledrawer.io matches 1 if score #compacting_type simpledrawer.io matches 0 run function simpledrawer:impl/new_drawer/compacting/interaction/interact/normal
execute if score #if_try_compacting simpledrawer.math matches 0 run function simpledrawer:impl/new_drawer/compacting/interaction/interact/try_compacting


