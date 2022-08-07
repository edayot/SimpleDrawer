data remove storage simpledrawer:io input
data modify storage simpledrawer:io input set from storage simpledrawer:main temp.ItemsInsert[0]
execute if data storage simpledrawer:io input run data modify storage simpledrawer:io input.Count set value 1b
function simpledrawer:drawer/working/input

execute if score #success simpledrawer.io matches 1 store result score #slot_remove simpledrawer.math run data get storage simpledrawer:main temp.ItemsInsert[0].Slot
execute if score #success simpledrawer.io matches 1 if score #slot_remove simpledrawer.math matches 0 run item modify block ~ ~ ~ container.0 simpledrawer:remove_count_output
execute if score #success simpledrawer.io matches 1 if score #slot_remove simpledrawer.math matches 1 run item modify block ~ ~ ~ container.1 simpledrawer:remove_count_output
execute if score #success simpledrawer.io matches 1 if score #slot_remove simpledrawer.math matches 2 run item modify block ~ ~ ~ container.2 simpledrawer:remove_count_output
execute if score #success simpledrawer.io matches 1 if score #slot_remove simpledrawer.math matches 3 run item modify block ~ ~ ~ container.3 simpledrawer:remove_count_output
execute if score #success simpledrawer.io matches 1 if score #slot_remove simpledrawer.math matches 4 run item modify block ~ ~ ~ container.4 simpledrawer:remove_count_output

execute if score #success simpledrawer.io matches 0 run data remove storage simpledrawer:main temp.ItemsInsert[0]
execute if score #success simpledrawer.io matches 0 if data storage simpledrawer:main temp.ItemsInsert[0] run function simpledrawer:drawer/working/hopper_insert/try_input
