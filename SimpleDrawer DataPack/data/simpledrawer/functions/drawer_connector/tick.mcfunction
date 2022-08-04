

function simpledrawer:drawer_connector/gui

data modify block ~ ~-1 ~ TransferCooldown set value 12
execute positioned ~ ~-1 ~ as @e[type=minecraft:hopper_minecart,distance=..1,tag=!simpledrawer.minecart_checked] run function simpledrawer:drawer_connector/minecart_protection/set



