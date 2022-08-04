tag @s add simpledrawer.drawer_connector.same_network
scoreboard players remove #max_connected_drawer simpledrawer.math 1

execute if score #max_connected_drawer simpledrawer.math matches 1.. positioned ~1 ~ ~ as @e[tag=simpledrawer.drawer.block,tag=!simpledrawer.drawer_connector.same_network,distance=..1] run function simpledrawer:drawer_connector/construct_network
execute if score #max_connected_drawer simpledrawer.math matches 1.. positioned ~-1 ~ ~ as @e[tag=simpledrawer.drawer.block,tag=!simpledrawer.drawer_connector.same_network,distance=..1] run function simpledrawer:drawer_connector/construct_network
execute if score #max_connected_drawer simpledrawer.math matches 1.. positioned ~ ~ ~1 as @e[tag=simpledrawer.drawer.block,tag=!simpledrawer.drawer_connector.same_network,distance=..1] run function simpledrawer:drawer_connector/construct_network
execute if score #max_connected_drawer simpledrawer.math matches 1.. positioned ~ ~ ~-1 as @e[tag=simpledrawer.drawer.block,tag=!simpledrawer.drawer_connector.same_network,distance=..1] run function simpledrawer:drawer_connector/construct_network
execute if score #max_connected_drawer simpledrawer.math matches 1.. positioned ~ ~1 ~ as @e[tag=simpledrawer.drawer.block,tag=!simpledrawer.drawer_connector.same_network,distance=..1] run function simpledrawer:drawer_connector/construct_network
execute if score #max_connected_drawer simpledrawer.math matches 1.. positioned ~ ~-1 ~ as @e[tag=simpledrawer.drawer.block,tag=!simpledrawer.drawer_connector.same_network,distance=..1] run function simpledrawer:drawer_connector/construct_network

