
scoreboard players add #global simpledrawer.drawer_controller.id 1
scoreboard players operation @s simpledrawer.drawer_controller.id = #global simpledrawer.drawer_controller.id
execute 
    positioned ~ ~-0.4 ~ positioned ^ ^ ^0.1
    summon interaction
    run function ~/place_interaction:
        tag @s add global.ignore
        tag @s add simpledrawer.drawer_controller.interaction


        tag @s add smithed.entity
        tag @s add smithed.strict

        scoreboard players operation @s simpledrawer.drawer_controller.id = #global simpledrawer.drawer_controller.id


        data merge entity @s {width:0.85,height:0.85} 



tag @s add itemio.container
tag @s add itemio.container.auto_handled_io
tag @s add itemio.container.not_vanilla_container


tag @s add smithed.block
tag @s add smithed.entity
tag @s add smithed.strict


tag @s add itemio.container
tag @s add itemio.container.auto_handled_io
tag @s add itemio.container.not_vanilla_container
tag @s add itemio.container.hopper

tag @s add global.ignore

function #itemio:calls/container/init


