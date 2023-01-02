clear @s stone{simpledrawer:{gui:1b}}
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



execute if score @s simpledrawer.config matches 1.. run scoreboard players enable @s simpledrawer.config
execute if score @s simpledrawer.config matches 1.. run scoreboard players set @s simpledrawer.config 0


