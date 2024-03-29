scoreboard players remove @s[scores={simpledrawer.player.output_cooldown=1..}] simpledrawer.player.output_cooldown 1
scoreboard players remove @s[scores={simpledrawer.player.input_cooldown=1..}] simpledrawer.player.input_cooldown 1

execute if score @s simpledrawer.config matches 1 run 
	tellraw @s from simpledrawer:player_config
execute if score @s simpledrawer.config matches 2 run scoreboard players set @s simpledrawer.config.output_mode 0
execute if score @s simpledrawer.config matches 3 run scoreboard players set @s simpledrawer.config.output_mode 1
execute if score @s simpledrawer.config matches 4 run scoreboard players set @s simpledrawer.config.output_mode 2


execute if score @s simpledrawer.config matches 5 run scoreboard players set @s simpledrawer.config.input_mode 0
execute if score @s simpledrawer.config matches 6 run scoreboard players set @s simpledrawer.config.input_mode 1
execute if score @s simpledrawer.config matches 7 run scoreboard players set @s simpledrawer.config.input_mode 2



#execute if score @s simpledrawer.config matches 1.. run advancement grant @s only simpledrawer:display/config/config
execute if score @s simpledrawer.config matches 1.. run scoreboard players enable @s simpledrawer.config
execute if score @s simpledrawer.config matches 1.. run scoreboard players set @s simpledrawer.config 0


execute if score @s simpledrawer.nb_click matches 32.. run advancement grant @s only simpledrawer:display/config/32_usage




execute if score @s simpledrawer.update_guide matches 1 run function simpledrawer:impl/guide/update


execute if score @s simpledrawer.leave_game matches 1
	run function simpledrawer:impl/tick_player/leave_game:
		scoreboard players enable @s simpledrawer.update_guide
		scoreboard players set @s simpledrawer.update_guide 0
		scoreboard players enable @s simpledrawer.config
		scoreboard players set @s simpledrawer.config 0

		scoreboard players set @s simpledrawer.leave_game 0
		