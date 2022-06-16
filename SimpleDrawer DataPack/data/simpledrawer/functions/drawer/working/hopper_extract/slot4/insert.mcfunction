
scoreboard players set #count_max simpledrawer.math 64
summon armor_stand ~ ~ ~ {NoGravity:1b,Silent:1b,Invulnerable:1b,Marker:1b,Invisible:1b,Tags:["simpledrawer.stack_test"],HandItems:[{id:"minecraft:stone",Count:1b},{}]}
data modify entity @e[tag=simpledrawer.stack_test,limit=1] HandItems[0].id set from storage simpledrawer:main temp.ItemTry.id

execute as @e[tag=simpledrawer.stack_test,limit=1] if predicate simpledrawer:stack16 run scoreboard players set #count_max simpledrawer.math 16
execute as @e[tag=simpledrawer.stack_test,limit=1] if predicate simpledrawer:stack1 run scoreboard players set #count_max simpledrawer.math 1

kill @e[tag=simpledrawer.stack_test,limit=1]

execute store result score #count_hopper simpledrawer.math run data get storage simpledrawer:main temp.ItemsHopper[{Slot:4b}].Count

execute if score #count_hopper simpledrawer.math < #count_max simpledrawer.math run function simpledrawer:drawer/working/hopper_extract/slot4/insert_2
