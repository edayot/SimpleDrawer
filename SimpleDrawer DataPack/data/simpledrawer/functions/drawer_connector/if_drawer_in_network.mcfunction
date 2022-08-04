data remove storage simpledrawer:io input
data modify storage simpledrawer:io input set from block ~ ~ ~ Items[{Slot:11b}]
execute if data storage simpledrawer:io input as @e[tag=simpledrawer.drawer_connector.same_network,tag=simpledrawer.drawer.block] run function simpledrawer:drawer_connector/try_input/11

execute if score #success_connector simpledrawer.math matches 0 run data remove storage simpledrawer:io input
execute if score #success_connector simpledrawer.math matches 0 run data modify storage simpledrawer:io input set from block ~ ~ ~ Items[{Slot:12b}]
execute if score #success_connector simpledrawer.math matches 0 if data storage simpledrawer:io input as @e[tag=simpledrawer.drawer_connector.same_network,tag=simpledrawer.drawer.block] run function simpledrawer:drawer_connector/try_input/12

execute if score #success_connector simpledrawer.math matches 0 run data remove storage simpledrawer:io input
execute if score #success_connector simpledrawer.math matches 0 run data modify storage simpledrawer:io input set from block ~ ~ ~ Items[{Slot:13b}]
execute if score #success_connector simpledrawer.math matches 0 if data storage simpledrawer:io input as @e[tag=simpledrawer.drawer_connector.same_network,tag=simpledrawer.drawer.block] run function simpledrawer:drawer_connector/try_input/13

execute if score #success_connector simpledrawer.math matches 0 run data remove storage simpledrawer:io input
execute if score #success_connector simpledrawer.math matches 0 run data modify storage simpledrawer:io input set from block ~ ~ ~ Items[{Slot:14b}]
execute if score #success_connector simpledrawer.math matches 0 if data storage simpledrawer:io input as @e[tag=simpledrawer.drawer_connector.same_network,tag=simpledrawer.drawer.block] run function simpledrawer:drawer_connector/try_input/14

execute if score #success_connector simpledrawer.math matches 0 run data remove storage simpledrawer:io input
execute if score #success_connector simpledrawer.math matches 0 run data modify storage simpledrawer:io input set from block ~ ~ ~ Items[{Slot:15b}]
execute if score #success_connector simpledrawer.math matches 0 if data storage simpledrawer:io input as @e[tag=simpledrawer.drawer_connector.same_network,tag=simpledrawer.drawer.block] run function simpledrawer:drawer_connector/try_input/15
