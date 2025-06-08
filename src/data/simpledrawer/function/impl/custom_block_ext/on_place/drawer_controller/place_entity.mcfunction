
scoreboard players add #global simpledrawer.drawer_connector.id 1
scoreboard players operation @s simpledrawer.drawer_connector.id = #global simpledrawer.drawer_connector.id
execute 
    positioned ~ ~-0.4 ~ positioned ^ ^ ^0.1
    summon interaction
    run function ~/place_interaction:
        tag @s add global.ignore
        tag @s add simpledrawer.drawer_connector.interaction


        tag @s add smithed.entity
        tag @s add smithed.strict

        scoreboard players operation @s simpledrawer.drawer_connector.id = #global simpledrawer.drawer_connector.id


        data merge entity @s {width:0.85,height:0.85} 
