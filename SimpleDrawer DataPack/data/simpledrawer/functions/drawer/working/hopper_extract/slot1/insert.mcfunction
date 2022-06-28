
scoreboard players set #count_max simpledrawer.math 64
data modify entity 00022e98-0000-0378-0000-037800000058 HandItems[0].id set from storage simpledrawer:main temp.ItemTry.id

execute as 00022e98-0000-0378-0000-037800000058 if predicate simpledrawer:stack16 run scoreboard players set #count_max simpledrawer.math 16
execute as 00022e98-0000-0378-0000-037800000058 if predicate simpledrawer:stack1 run scoreboard players set #count_max simpledrawer.math 1


execute store result score #count_hopper simpledrawer.math run data get storage simpledrawer:main temp.ItemsHopper[{Slot:1b}].Count

execute if score #count_hopper simpledrawer.math < #count_max simpledrawer.math run function simpledrawer:drawer/working/hopper_extract/slot1/insert_2
