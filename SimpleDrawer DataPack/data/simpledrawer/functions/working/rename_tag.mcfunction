execute if entity @s[tag=SD_east] positioned ~0.1 ~ ~ run tag @e[type=glow_item_frame,tag=SD_DrawerItem,sort=nearest,limit=1,tag=SD_east] add SD_selected
execute if entity @s[tag=SD_north] positioned ~ ~ ~-0.1 run tag @e[type=glow_item_frame,tag=SD_DrawerItem,sort=nearest,limit=1,tag=SD_north] add SD_selected
execute if entity @s[tag=SD_south] positioned ~ ~ ~0.1 run tag @e[type=glow_item_frame,tag=SD_DrawerItem,sort=nearest,limit=1,tag=SD_south] add SD_selected
execute if entity @s[tag=SD_west] positioned ~-0.1 ~ ~ run tag @e[type=glow_item_frame,tag=SD_DrawerItem,sort=nearest,limit=1,tag=SD_west] add SD_selected


tag @s add simpledrawer.DrawerBlock
tag @s[tag=SD_north] add simpledrawer.north
tag @s[tag=SD_south] add simpledrawer.south
tag @s[tag=SD_east] add simpledrawer.east
tag @s[tag=SD_west] add simpledrawer.west

tag @e[type=glow_item_frame,tag=SD_selected] add simpledrawer.DrawerItem
tag @e[type=glow_item_frame,tag=SD_selected,tag=SD_north] add simpledrawer.north
tag @e[type=glow_item_frame,tag=SD_selected,tag=SD_south] add simpledrawer.south
tag @e[type=glow_item_frame,tag=SD_selected,tag=SD_east] add simpledrawer.east
tag @e[type=glow_item_frame,tag=SD_selected,tag=SD_west] add simpledrawer.west
tag @e[type=glow_item_frame,tag=SD_selected,tag=SD_filled] add simpledrawer.filled

tag @s remove SD_DrawerBlock
tag @s remove SD_north
tag @s remove SD_south
tag @s remove SD_east
tag @s remove SD_west

tag @e[type=glow_item_frame,tag=SD_selected] remove SD_north
tag @e[type=glow_item_frame,tag=SD_selected] remove SD_south
tag @e[type=glow_item_frame,tag=SD_selected] remove SD_east
tag @e[type=glow_item_frame,tag=SD_selected] remove SD_west
tag @e[type=glow_item_frame,tag=SD_selected] remove SD_filled

tag @e[type=glow_item_frame,tag=SD_selected] remove SD_selected


scoreboard objectives remove simpledrawer.tempC
scoreboard objectives remove simpledrawer.sneak
scoreboard objectives remove simpledrawer.time