execute if score @s simpledrawer.config.input_mode matches 0 if score @s simpledrawer.player.input_cooldown matches 0 run data modify storage simpledrawer:io input.Count set value 1b
execute if score @s simpledrawer.config.input_mode matches 1 run data modify storage simpledrawer:io input.Count set value 1b
