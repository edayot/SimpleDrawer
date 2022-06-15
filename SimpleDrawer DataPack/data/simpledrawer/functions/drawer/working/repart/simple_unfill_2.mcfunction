data modify entity @s ItemRotation set value 0b


scoreboard players set #count simpledrawer.io 64
summon armor_stand ~ ~ ~ {NoGravity:1b,Silent:1b,Invulnerable:1b,Marker:1b,Invisible:1b,Tags:["simpledrawer.stack_test"],HandItems:[{id:"minecraft:stone",Count:1b},{}]}
data modify entity @e[tag=simpledrawer.stack_test,limit=1] HandItems[0].id set from entity @s Item.tag.simpledrawer.Item.id

execute as @e[tag=simpledrawer.stack_test,limit=1] if predicate simpledrawer:stack16 run scoreboard players set #count simpledrawer.io 16
execute as @e[tag=simpledrawer.stack_test,limit=1] if predicate simpledrawer:stack1 run scoreboard players set #count simpledrawer.io 1

kill @e[tag=simpledrawer.stack_test,limit=1]

function simpledrawer:drawer/working/output

execute if score #success simpledrawer.io matches 1 run function simpledrawer:drawer/working/repart/simple_unfill_3
