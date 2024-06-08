scoreboard players remove @s[scores={simpledrawer.player.output_cooldown=1..}] simpledrawer.player.output_cooldown 1
scoreboard players remove @s[scores={simpledrawer.player.input_cooldown=1..}] simpledrawer.player.input_cooldown 1




execute if score @s simpledrawer.nb_click matches 32.. run advancement grant @s only simpledrawer:display/config/32_usage




execute 
	if items entity @s weapon.mainhand written_book[custom_data~{smithed:{id:"airdox_:simpledrawer/guide"}},!custom_data~{simpledrawer:{version:{major:1,minor:11,patch:2}}}]
	run item modify entity @s weapon.mainhand simpledrawer:impl/guide_modifier





execute if score @s simpledrawer.leave_game matches 1
	run function simpledrawer:impl/tick_player/leave_game:

		scoreboard players set @s simpledrawer.leave_game 0
		