execute if score @s simpledrawer.config.input_mode matches 0 if score @s simpledrawer.player.input_cooldown matches 1.. run scoreboard players set @s simpledrawer.player.output_cooldown 15
scoreboard players set @s simpledrawer.player.input_cooldown 5
item modify entity @s weapon.mainhand simpledrawer:remove_count_output
