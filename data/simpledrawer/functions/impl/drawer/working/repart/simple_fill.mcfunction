data modify storage simpledrawer:io input set from storage simpledrawer:main temp.ItemInput
execute if score @s simpledrawer.config.input_mode matches 0 if score @s simpledrawer.player.input_cooldown matches 0 run data modify storage simpledrawer:io input.Count set value 1b
execute if score @s simpledrawer.config.input_mode matches 1 run data modify storage simpledrawer:io input.Count set value 1b

execute as @e[tag=simpledrawer.selected,limit=1] run function simpledrawer:impl/drawer/working/repart/simple_fill_2

execute if score #success simpledrawer.io matches 1 as @s if score @s simpledrawer.config.input_mode matches 0 if score @s simpledrawer.player.input_cooldown matches 1.. run scoreboard players set @s simpledrawer.player.output_cooldown 15
execute if score #success simpledrawer.io matches 1 run scoreboard players set @s simpledrawer.player.input_cooldown 5
execute if score #success simpledrawer.io matches 1 run item modify entity @s weapon.mainhand simpledrawer:remove_count_output
