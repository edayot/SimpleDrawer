tag @s remove simpledrawer.drawer.to_update

scoreboard players set #count simpledrawer.math 0
scoreboard players operation #count simpledrawer.math = @s simpledrawer.drawer.Count
scoreboard players operation #maxCount simpledrawer.math = @s simpledrawer.drawer.maxCount
item modify entity @s container.0 simpledrawer:impl/drawer_display
