scoreboard players set #already simpledrawer.math 1
scoreboard players set #cooldown simpledrawer.math 0
scoreboard players operation #cooldown simpledrawer.math = @p[tag=simpledrawer.adder] simpledrawer.player.output_cooldown
scoreboard players operation #mode simpledrawer.math = @p[tag=simpledrawer.adder] simpledrawer.config.output_mode

scoreboard players set #count simpledrawer.io 1
execute if score #mode simpledrawer.math matches 0 unless score #cooldown simpledrawer.math matches 1.. run scoreboard players set #count simpledrawer.io 1
execute if score #mode simpledrawer.math matches 0 if score #cooldown simpledrawer.math matches 1.. run scoreboard players set #count simpledrawer.io 63

execute if score #mode simpledrawer.math matches 0 if score #input_slot simpledrawer.io matches 0 if score #cooldown simpledrawer.math matches 1.. run data modify entity 93682a08-d099-4e8f-a4a6-1e33a3692301 HandItems[0].id set from entity @s Item.tag.simpledrawer.Item0.id
execute if score #mode simpledrawer.math matches 0 if score #input_slot simpledrawer.io matches 1 if score #cooldown simpledrawer.math matches 1.. run data modify entity 93682a08-d099-4e8f-a4a6-1e33a3692301 HandItems[0].id set from entity @s Item.tag.simpledrawer.Item1.id
execute if score #mode simpledrawer.math matches 0 if score #input_slot simpledrawer.io matches 2 if score #cooldown simpledrawer.math matches 1.. run data modify entity 93682a08-d099-4e8f-a4a6-1e33a3692301 HandItems[0].id set from entity @s Item.tag.simpledrawer.Item2.id
execute if score #mode simpledrawer.math matches 0 if score #input_slot simpledrawer.io matches 3 if score #cooldown simpledrawer.math matches 1.. run data modify entity 93682a08-d099-4e8f-a4a6-1e33a3692301 HandItems[0].id set from entity @s Item.tag.simpledrawer.Item3.id
execute if score #mode simpledrawer.math matches 0 if score #input_slot simpledrawer.io matches 4 if score #cooldown simpledrawer.math matches 1.. run data modify entity 93682a08-d099-4e8f-a4a6-1e33a3692301 HandItems[0].id set from entity @s Item.tag.simpledrawer.Item4.id
execute if score #mode simpledrawer.math matches 0 if score #input_slot simpledrawer.io matches 5 if score #cooldown simpledrawer.math matches 1.. run data modify entity 93682a08-d099-4e8f-a4a6-1e33a3692301 HandItems[0].id set from entity @s Item.tag.simpledrawer.Item5.id

execute if score #mode simpledrawer.math matches 0 if score #cooldown simpledrawer.math matches 1.. as 93682a08-d099-4e8f-a4a6-1e33a3692301 if predicate simpledrawer:stack16 run scoreboard players set #count simpledrawer.io 15
execute if score #mode simpledrawer.math matches 0 if score #cooldown simpledrawer.math matches 1.. as 93682a08-d099-4e8f-a4a6-1e33a3692301 if predicate simpledrawer:stack1 run scoreboard players set #count simpledrawer.io 1
execute if score #mode simpledrawer.math matches 0 if score #cooldown simpledrawer.math matches 1.. run scoreboard players set @p[tag=simpledrawer.adder] simpledrawer.player.output_cooldown -1

execute if score #mode simpledrawer.math matches 1 run scoreboard players set #count simpledrawer.io 1

execute if score #mode simpledrawer.math matches 2 run scoreboard players set #count simpledrawer.io 64

execute if score #mode simpledrawer.math matches 2 if score #input_slot simpledrawer.io matches 0 run data modify entity 93682a08-d099-4e8f-a4a6-1e33a3692301 HandItems[0].id set from entity @s Item.tag.simpledrawer.Item0.id
execute if score #mode simpledrawer.math matches 2 if score #input_slot simpledrawer.io matches 1 run data modify entity 93682a08-d099-4e8f-a4a6-1e33a3692301 HandItems[0].id set from entity @s Item.tag.simpledrawer.Item1.id
execute if score #mode simpledrawer.math matches 2 if score #input_slot simpledrawer.io matches 2 run data modify entity 93682a08-d099-4e8f-a4a6-1e33a3692301 HandItems[0].id set from entity @s Item.tag.simpledrawer.Item2.id
execute if score #mode simpledrawer.math matches 2 if score #input_slot simpledrawer.io matches 3 run data modify entity 93682a08-d099-4e8f-a4a6-1e33a3692301 HandItems[0].id set from entity @s Item.tag.simpledrawer.Item3.id
execute if score #mode simpledrawer.math matches 2 if score #input_slot simpledrawer.io matches 4 run data modify entity 93682a08-d099-4e8f-a4a6-1e33a3692301 HandItems[0].id set from entity @s Item.tag.simpledrawer.Item4.id
execute if score #mode simpledrawer.math matches 2 if score #input_slot simpledrawer.io matches 5 run data modify entity 93682a08-d099-4e8f-a4a6-1e33a3692301 HandItems[0].id set from entity @s Item.tag.simpledrawer.Item5.id

execute if score #mode simpledrawer.math matches 2 as 93682a08-d099-4e8f-a4a6-1e33a3692301 if predicate simpledrawer:stack16 run scoreboard players set #count simpledrawer.io 16
execute if score #mode simpledrawer.math matches 2 as 93682a08-d099-4e8f-a4a6-1e33a3692301 if predicate simpledrawer:stack1 run scoreboard players set #count simpledrawer.io 1
execute if score #mode simpledrawer.math matches 2 run scoreboard players set @p[tag=simpledrawer.adder] simpledrawer.player.output_cooldown -1


function simpledrawer:impl/new_drawer/working/output

execute if score #success simpledrawer.io matches 1 run function simpledrawer:impl/new_drawer/click/repart/simple_unfill/end



