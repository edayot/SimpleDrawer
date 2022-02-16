#boolean check extract
scoreboard players set @s simpledrawer.tempC 1

execute if entity @s[tag=simpledrawer.east] positioned ~0.1 ~ ~ run tag @e[type=glow_item_frame,tag=simpledrawer.DrawerItem,sort=nearest,limit=1,tag=simpledrawer.east] add simpledrawer.selected
execute if entity @s[tag=simpledrawer.north] positioned ~ ~ ~-0.1 run tag @e[type=glow_item_frame,tag=simpledrawer.DrawerItem,sort=nearest,limit=1,tag=simpledrawer.north] add simpledrawer.selected
execute if entity @s[tag=simpledrawer.south] positioned ~ ~ ~0.1 run tag @e[type=glow_item_frame,tag=simpledrawer.DrawerItem,sort=nearest,limit=1,tag=simpledrawer.south] add simpledrawer.selected
execute if entity @s[tag=simpledrawer.west] positioned ~-0.1 ~ ~ run tag @e[type=glow_item_frame,tag=simpledrawer.DrawerItem,sort=nearest,limit=1,tag=simpledrawer.west] add simpledrawer.selected

execute if entity @e[tag=simpledrawer.selected,tag=!simpledrawer.filled] run scoreboard players set @s simpledrawer.tempC 0

execute if score @s simpledrawer.tempC matches 1 positioned ~ ~-1 ~ if data block ~ ~ ~ Items[{Slot:0b}] unless data block ~ ~ ~ Items[{Slot:0b,Count:64b}] run function simpledrawer:hopper_extract/items0/check
execute if score @s simpledrawer.tempC matches 1 positioned ~ ~-1 ~ unless data block ~ ~ ~ Items[{Slot:0b}] unless data block ~ ~ ~ Items[{Slot:0b,Count:64b}] run function simpledrawer:hopper_extract/items0/extract

execute if score @s simpledrawer.tempC matches 1 positioned ~ ~-1 ~ if data block ~ ~ ~ Items[{Slot:1b}] unless data block ~ ~ ~ Items[{Slot:1b,Count:64b}] run function simpledrawer:hopper_extract/items1/check
execute if score @s simpledrawer.tempC matches 1 positioned ~ ~-1 ~ unless data block ~ ~ ~ Items[{Slot:1b}] unless data block ~ ~ ~ Items[{Slot:1b,Count:64b}] run function simpledrawer:hopper_extract/items1/extract

execute if score @s simpledrawer.tempC matches 1 positioned ~ ~-1 ~ if data block ~ ~ ~ Items[{Slot:2b}] unless data block ~ ~ ~ Items[{Slot:2b,Count:64b}] run function simpledrawer:hopper_extract/items2/check
execute if score @s simpledrawer.tempC matches 1 positioned ~ ~-1 ~ unless data block ~ ~ ~ Items[{Slot:2b}] unless data block ~ ~ ~ Items[{Slot:2b,Count:64b}] run function simpledrawer:hopper_extract/items2/extract

execute if score @s simpledrawer.tempC matches 1 positioned ~ ~-1 ~ if data block ~ ~ ~ Items[{Slot:3b}] unless data block ~ ~ ~ Items[{Slot:3b,Count:64b}] run function simpledrawer:hopper_extract/items3/check
execute if score @s simpledrawer.tempC matches 1 positioned ~ ~-1 ~ unless data block ~ ~ ~ Items[{Slot:3b}] unless data block ~ ~ ~ Items[{Slot:3b,Count:64b}] run function simpledrawer:hopper_extract/items3/extract

execute if score @s simpledrawer.tempC matches 1 positioned ~ ~-1 ~ if data block ~ ~ ~ Items[{Slot:4b}] unless data block ~ ~ ~ Items[{Slot:4b,Count:64b}] run function simpledrawer:hopper_extract/items4/check
execute if score @s simpledrawer.tempC matches 1 positioned ~ ~-1 ~ unless data block ~ ~ ~ Items[{Slot:4b}] unless data block ~ ~ ~ Items[{Slot:4b,Count:64b}] run function simpledrawer:hopper_extract/items4/extract


#say @e[type=glow_item_frame,tag=simpledrawer.selected]
tag @e[type=glow_item_frame,tag=simpledrawer.selected] remove simpledrawer.selected
execute unless score @s simpledrawer.tempC matches 1 run scoreboard players set @s simpledrawer.time 8
