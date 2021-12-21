scoreboard players set @s SD_tempC 1

execute if entity @s[tag=SD_east] positioned ~0.1 ~ ~ run tag @e[type=glow_item_frame,tag=SD_DrawerItem,sort=nearest,limit=1,tag=SD_east] add SD_selected
execute if entity @s[tag=SD_north] positioned ~ ~ ~-0.1 run tag @e[type=glow_item_frame,tag=SD_DrawerItem,sort=nearest,limit=1,tag=SD_north] add SD_selected
execute if entity @s[tag=SD_south] positioned ~ ~ ~0.1 run tag @e[type=glow_item_frame,tag=SD_DrawerItem,sort=nearest,limit=1,tag=SD_south] add SD_selected
execute if entity @s[tag=SD_west] positioned ~-0.1 ~ ~ run tag @e[type=glow_item_frame,tag=SD_DrawerItem,sort=nearest,limit=1,tag=SD_west] add SD_selected




execute if score @s SD_tempC matches 1 if entity @e[type=glow_item_frame,tag=SD_selected,tag=filled] positioned ~ ~-1 ~ if data block ~ ~2 ~ Items[{Slot:0b}] run function simpledrawer:hopper_insert/items0/check
execute if score @s SD_tempC matches 1 if entity @e[type=glow_item_frame,tag=SD_selected,tag=!filled] positioned ~ ~-1 ~ if data block ~ ~2 ~ Items[{Slot:0b}] run function simpledrawer:hopper_insert/items0/first

execute if score @s SD_tempC matches 1 if entity @e[type=glow_item_frame,tag=SD_selected,tag=filled] positioned ~ ~-1 ~ if data block ~ ~2 ~ Items[{Slot:1b}] run function simpledrawer:hopper_insert/items1/check
execute if score @s SD_tempC matches 1 if entity @e[type=glow_item_frame,tag=SD_selected,tag=!filled] positioned ~ ~-1 ~ if data block ~ ~2 ~ Items[{Slot:1b}] run function simpledrawer:hopper_insert/items1/first

execute if score @s SD_tempC matches 1 if entity @e[type=glow_item_frame,tag=SD_selected,tag=filled] positioned ~ ~-1 ~ if data block ~ ~2 ~ Items[{Slot:2b}] run function simpledrawer:hopper_insert/items2/check
execute if score @s SD_tempC matches 1 if entity @e[type=glow_item_frame,tag=SD_selected,tag=!filled] positioned ~ ~-1 ~ if data block ~ ~2 ~ Items[{Slot:2b}] run function simpledrawer:hopper_insert/items2/first

execute if score @s SD_tempC matches 1 if entity @e[type=glow_item_frame,tag=SD_selected,tag=filled] positioned ~ ~-1 ~ if data block ~ ~2 ~ Items[{Slot:3b}] run function simpledrawer:hopper_insert/items3/check
execute if score @s SD_tempC matches 1 if entity @e[type=glow_item_frame,tag=SD_selected,tag=!filled] positioned ~ ~-1 ~ if data block ~ ~2 ~ Items[{Slot:3b}] run function simpledrawer:hopper_insert/items3/first

execute if score @s SD_tempC matches 1 if entity @e[type=glow_item_frame,tag=SD_selected,tag=filled] positioned ~ ~-1 ~ if data block ~ ~2 ~ Items[{Slot:4b}] run function simpledrawer:hopper_insert/items4/check
execute if score @s SD_tempC matches 1 if entity @e[type=glow_item_frame,tag=SD_selected,tag=!filled] positioned ~ ~-1 ~ if data block ~ ~2 ~ Items[{Slot:4b}] run function simpledrawer:hopper_insert/items4/first

tag @e remove SD_selected
