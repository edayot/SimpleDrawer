
execute positioned ~ ~-1 ~ run tag @e[type=minecraft:hopper_minecart,distance=..1,nbt={Enabled:1b}] add simpledrawer.selected_hopper
execute if entity @e[tag=simpledrawer.selected_hopper] run function simpledrawer:drawer/working/minecart_hopper_extract/main
tag @e[tag=simpledrawer.selected_hopper] remove simpledrawer.selected_hopper