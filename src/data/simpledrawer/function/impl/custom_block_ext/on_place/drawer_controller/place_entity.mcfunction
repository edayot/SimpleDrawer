
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

execute 
    positioned ~ ~ ~ positioned ^ ^ ^1
    summon item_display
    run function ~/place_display:
        tag @s add global.ignore
        tag @s add simpledrawer.drawer_controller.display


        tag @s add smithed.entity
        tag @s add smithed.strict

        scoreboard players operation @s simpledrawer.drawer_controller.id = #global simpledrawer.drawer_controller.id

        data modify entity @s item set value {id: "minecraft:furnace", count: 1, components: {"minecraft:item_model": "simpledrawer:drawer_controller"}}
        data merge entity @s {transformation:{scale:[1.001f,1.001f,1.001f],translation:[0.0f,0.0f,-1.0f]}}

        tp @s ~ ~ ~ ~ ~




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


