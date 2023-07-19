# Versioning (for future use)

scoreboard players operation @s simpledrawer.block.major = #simpledrawer.major load.status
scoreboard players operation @s simpledrawer.block.minor = #simpledrawer.minor load.status
scoreboard players operation @s simpledrawer.block.patch = #simpledrawer.patch load.status



tag @s add simpledrawer.block
tag @s add simpledrawer.drawer.block
tag @s add simpledrawer.drawer

tag @s add itemio.container
tag @s add itemio.container.auto_handled_io
tag @s add itemio.container.hopper
tag @s add itemio.container.not_vanilla_container

tag @s add global.ignore

function #itemio:calls/container/init
