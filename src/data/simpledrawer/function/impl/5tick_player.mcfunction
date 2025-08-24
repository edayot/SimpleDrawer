



execute if score @s simpledrawer.nb_click matches 32.. run advancement grant @s only simpledrawer:display/config/32_usage



scoreboard players enable @s simpledrawer.break
execute if score @s simpledrawer.break matches 1.. run function ~/enable_break:
	scoreboard players set @s simpledrawer.break_cooldown 480
	scoreboard players set @s simpledrawer.break 0
	tellraw @s [
		{"translate":"simpledrawer.tellraw_prefix","color":"dark_red"},
		{"translate":"simpledrawer.text.destroy_cooldown","color":"red"}
	]
execute if score @s simpledrawer.break_cooldown matches 0 run tellraw @s [
	{"translate":"simpledrawer.tellraw_prefix","color":"dark_red"},
	{"translate":"simpledrawer.text.end_destroy_cooldown","color":"red"}
]
execute if score @s simpledrawer.break_cooldown matches 0.. run scoreboard players remove @s simpledrawer.break_cooldown 1


major,minor,patch = ctx.project_version.split('.')

execute 
	if items entity @s weapon.mainhand written_book[
		custom_data~{smithed:{id:"airdox_:simpledrawer/guide"}},
		!custom_data~{simpledrawer:{version:{major:int(major),minor:int(minor),patch:int(patch)}}}
	]
	run item modify entity @s weapon.mainhand simpledrawer:impl/guide



execute 
	if items entity @s container.* furnace[
		custom_data~{ctc:{id:"new_drawer",from:"airdox_:simpledrawer"}},
		!item_model="simpledrawer:new_drawer"
	]
	run function ./upgrade_new_drawer:
		for i in range(4*7):
			execute 
				if items entity @s f"container.{i}" furnace[
					custom_data~{ctc:{id:"new_drawer",from:"airdox_:simpledrawer"}},
					!item_model="simpledrawer:new_drawer"
				] 
				run item modify entity @s f"container.{i}" { \
					"function": "minecraft:set_components", \
					"components": { \
						"minecraft:item_model": "simpledrawer:new_drawer", \
					} \
				}
