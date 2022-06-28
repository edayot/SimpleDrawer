data modify entity @s ItemRotation set value 0b


scoreboard players set #count simpledrawer.io 64
data modify entity 00022e98-0000-0378-0000-037800000058 HandItems[0].id set from entity @s Item.tag.simpledrawer.Item.id

execute as 00022e98-0000-0378-0000-037800000058 if predicate simpledrawer:stack16 run scoreboard players set #count simpledrawer.io 16
execute as 00022e98-0000-0378-0000-037800000058 if predicate simpledrawer:stack1 run scoreboard players set #count simpledrawer.io 1


function simpledrawer:drawer/working/output

execute if score #success simpledrawer.io matches 1 run function simpledrawer:drawer/working/repart/simple_unfill_3
