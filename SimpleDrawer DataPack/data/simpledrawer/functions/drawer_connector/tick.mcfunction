




scoreboard players operation #max_connected_drawer simpledrawer.math = #max_connected_drawer simpledrawer.config
function simpledrawer:drawer_connector/construct_network
#say @e[tag=simpledrawer.drawer_connector.same_network]

scoreboard players set #success_connector simpledrawer.math 0


execute if entity @e[tag=simpledrawer.drawer_connector.same_network,tag=simpledrawer.drawer.block] run function simpledrawer:drawer_connector/if_drawer_in_network

tag @e remove simpledrawer.drawer_connector.same_network