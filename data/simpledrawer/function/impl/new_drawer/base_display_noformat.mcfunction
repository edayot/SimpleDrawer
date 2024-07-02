
scoreboard players set #noformat simpledrawer.math 1
function simpledrawer:impl/new_drawer/base_display
scoreboard players set #noformat simpledrawer.math 0

tag @s add simpledrawer.new_drawer.to_update


scoreboard players set @s simpledrawer.new_drawer.no_format_cooldown 20
