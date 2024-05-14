# Versioning (for future use)

scoreboard players operation @s simpledrawer.block.major = #simpledrawer.major load.status
scoreboard players operation @s simpledrawer.block.minor = #simpledrawer.minor load.status
scoreboard players operation @s simpledrawer.block.patch = #simpledrawer.patch load.status









execute if score #facing simpledrawer.math matches 0 run tag @s add simpledrawer.new_drawer.base.north
execute if score #facing simpledrawer.math matches 1 run tag @s add simpledrawer.new_drawer.base.south
execute if score #facing simpledrawer.math matches 2 run tag @s add simpledrawer.new_drawer.base.east
execute if score #facing simpledrawer.math matches 3 run tag @s add simpledrawer.new_drawer.base.west



scoreboard players operation @s simpledrawer.new_drawer.id = #global simpledrawer.new_drawer.id


execute positioned ^ ^ ^1 summon item_display run function simpledrawer:impl/new_drawer/place/base_block



data modify entity @s item set value {id:"minecraft:barrier",count:1,components:{"minecraft:custom_model_data":1430000,"minecraft:custom_data":{simpledrawer:{}}}}
data modify entity @s item.components."minecraft:custom_data".simpledrawer set from storage simpledrawer:main temp.simpledrawer


execute store result score #maxCount simpledrawer.math run data get entity @s item.components."minecraft:custom_data".simpledrawer.maxCount

tag @s add simpledrawer.block
tag @s add simpledrawer.new_drawer.base
tag @s add global.ignore
tag @s add simpledrawer.new_drawer.part
tag @s add simpledrawer.new_drawer.part.base
scoreboard players set @s simpledrawer.new_drawer.as_players_entities 1


execute if data storage simpledrawer:main temp.item.components."minecraft:custom_data".simpledrawer{hopper:1b} run tag @s add simpledrawer.new_drawer.hopper
execute if data storage simpledrawer:main temp.item.components."minecraft:custom_data".simpledrawer{hopper:1b} run tag @s add itemio.container.hopper


tag @s add smithed.block
tag @s add smithed.entity
tag @s add smithed.strict


tag @s add itemio.container
tag @s add itemio.container.auto_handled_io
tag @s add itemio.container.not_vanilla_container

tag @s add global.ignore

function #itemio:calls/container/init

tp @s ~ ~ ~ ~ ~


scoreboard players operation #place_id simpledrawer.math = @s simpledrawer.new_drawer.id
function simpledrawer:impl/new_drawer/place/variant

function simpledrawer:impl/new_drawer/base_display

execute if data storage simpledrawer:main temp.item.components."minecraft:custom_data".simpledrawer{wood_type:"simpledrawer:ice"} run tag @s add simpledrawer.new_drawer.stone_base
execute if data storage simpledrawer:main temp.item.components."minecraft:custom_data".simpledrawer{wood_type:"simpledrawer:ice"} run tag @s remove simpledrawer.new_drawer.wood_base

scoreboard players set #temp simpledrawer.math 0
execute store success score #temp simpledrawer.math if entity @s[tag=simpledrawer.new_drawer.wood_base] run setblock ~ ~ ~ beehive
execute store success score #temp simpledrawer.math if entity @s[tag=simpledrawer.new_drawer.stone_base] run setblock ~ ~ ~ lodestone

execute 
    if score #temp simpledrawer.math matches 0
    run setblock ~ ~ ~ beehive
execute 
    if score #temp simpledrawer.math matches 0
    run tag @s add simpledrawer.new_drawer.wood_base
execute 
    if score #temp simpledrawer.math matches 0
    run tag @s remove simpledrawer.new_drawer.stone_base

