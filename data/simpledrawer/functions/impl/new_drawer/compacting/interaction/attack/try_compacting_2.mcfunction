


data remove storage simpledrawer:io input_compacting
data modify storage simpledrawer:io input_compacting set from entity @s item.tag.simpledrawer.Items[{Slot:0}]
scoreboard players set #success_compacting simpledrawer.io 0
function #simpledrawer:compacting


execute if score #success_compacting simpledrawer.io matches 1 run function simpledrawer:impl/new_drawer/compacting/interaction/attack/try_compacting_3

