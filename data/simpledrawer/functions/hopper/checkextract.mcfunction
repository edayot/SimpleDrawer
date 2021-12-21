#boolean check extract
scoreboard players set @s SD_tempC 1

execute if entity @s[tag=SD_east] positioned ~0.1 ~ ~ run tag @e[type=glow_item_frame,tag=SD_DrawerItem,sort=nearest,limit=1,tag=SD_east] add SD_selected
execute if entity @s[tag=SD_north] positioned ~ ~ ~-0.1 run tag @e[type=glow_item_frame,tag=SD_DrawerItem,sort=nearest,limit=1,tag=SD_north] add SD_selected
execute if entity @s[tag=SD_south] positioned ~ ~ ~0.1 run tag @e[type=glow_item_frame,tag=SD_DrawerItem,sort=nearest,limit=1,tag=SD_south] add SD_selected
execute if entity @s[tag=SD_west] positioned ~-0.1 ~ ~ run tag @e[type=glow_item_frame,tag=SD_DrawerItem,sort=nearest,limit=1,tag=SD_west] add SD_selected

execute if entity @e[tag=SD_selected,tag=!filled] run scoreboard players set @s SD_tempC 0

execute if score @s SD_tempC matches 1 positioned ~ ~-1 ~ if data block ~ ~ ~ Items[{Slot:0b}] unless data block ~ ~ ~ Items[{Slot:0b,Count:64b}] run function simpledrawerhopper/items0/check
execute if score @s SD_tempC matches 1 positioned ~ ~-1 ~ unless data block ~ ~ ~ Items[{Slot:0b}] unless data block ~ ~ ~ Items[{Slot:0b,Count:64b}] run function simpledrawerhopper/items0/extract

execute if score @s SD_tempC matches 1 positioned ~ ~-1 ~ if data block ~ ~ ~ Items[{Slot:1b}] unless data block ~ ~ ~ Items[{Slot:1b,Count:64b}] run function simpledrawerhopper/items1/check
execute if score @s SD_tempC matches 1 positioned ~ ~-1 ~ unless data block ~ ~ ~ Items[{Slot:1b}] unless data block ~ ~ ~ Items[{Slot:1b,Count:64b}] run function simpledrawerhopper/items1/extract

execute if score @s SD_tempC matches 1 positioned ~ ~-1 ~ if data block ~ ~ ~ Items[{Slot:2b}] unless data block ~ ~ ~ Items[{Slot:2b,Count:64b}] run function simpledrawerhopper/items2/check
execute if score @s SD_tempC matches 1 positioned ~ ~-1 ~ unless data block ~ ~ ~ Items[{Slot:2b}] unless data block ~ ~ ~ Items[{Slot:2b,Count:64b}] run function simpledrawerhopper/items2/extract

execute if score @s SD_tempC matches 1 positioned ~ ~-1 ~ if data block ~ ~ ~ Items[{Slot:3b}] unless data block ~ ~ ~ Items[{Slot:3b,Count:64b}] run function simpledrawerhopper/items3/check
execute if score @s SD_tempC matches 1 positioned ~ ~-1 ~ unless data block ~ ~ ~ Items[{Slot:3b}] unless data block ~ ~ ~ Items[{Slot:3b,Count:64b}] run function simpledrawerhopper/items3/extract

execute if score @s SD_tempC matches 1 positioned ~ ~-1 ~ if data block ~ ~ ~ Items[{Slot:4b}] unless data block ~ ~ ~ Items[{Slot:4b,Count:64b}] run function simpledrawerhopper/items4/check
execute if score @s SD_tempC matches 1 positioned ~ ~-1 ~ unless data block ~ ~ ~ Items[{Slot:4b}] unless data block ~ ~ ~ Items[{Slot:4b,Count:64b}] run function simpledrawerhopper/items4/extract


#say @e[type=glow_item_frame,tag=SD_selected]
tag @e remove SD_selected

