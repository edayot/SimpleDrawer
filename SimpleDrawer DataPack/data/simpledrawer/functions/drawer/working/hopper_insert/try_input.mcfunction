data remove storage simpledrawer:io input
data modify storage simpledrawer:io input set from storage simpledrawer:main temp.ItemsInsert[0]
execute if data storage simpledrawer:io input run data modify storage simpledrawer:io input.Count set value 1b
function simpledrawer:drawer/working/input

execute if score #success simpledrawer.io matches 1 if score #count_output simpledrawer.io matches 0 store result storage simpledrawer:main temp.ItemsInsert[0].Count byte -0.999 run data get storage simpledrawer:main temp.ItemsInsert[0].Count -1
execute if score #success simpledrawer.io matches 1 if score #count_output simpledrawer.io matches 0 run data modify block ~ ~ ~ Items append from storage simpledrawer:main temp.ItemsInsert[0]

execute if score #success simpledrawer.io matches 0 run data remove storage simpledrawer:main temp.ItemsInsert[0]
execute if score #success simpledrawer.io matches 0 if data storage simpledrawer:main temp.ItemsInsert[0] run function simpledrawer:drawer/working/hopper_insert/try_input
