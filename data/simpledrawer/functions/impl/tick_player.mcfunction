



execute if score @s simpledrawer.nb_click matches 32.. run advancement grant @s only simpledrawer:display/config/32_usage




major,minor,patch = ctx.project_version.split('.')

execute 
	if items entity @s weapon.mainhand written_book[
		custom_data~{smithed:{id:"airdox_:simpledrawer/guide"}},
		!custom_data~{simpledrawer:{version:{major:int(major),minor:int(minor),patch:int(patch)}}}
	]
	run item modify entity @s weapon.mainhand simpledrawer:impl/guide_modifier
