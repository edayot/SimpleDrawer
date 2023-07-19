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


data modify storage simpledrawer:main temp.item set value {id:"minecraft:air",Count:1b,tag:{CustomModelData:1430000,simpledrawer:{}}}

data modify storage simpledrawer:main temp.item.tag.simpledrawer set from storage simpledrawer:main temp.simpledrawer
data modify entity @s item set from storage simpledrawer:main temp.item
execute store result score #maxCount simpledrawer.math run data get entity @s item.tag.simpledrawer.maxCount

tag @s add simpledrawer.block
tag @s add simpledrawer.new_drawer.base
tag @s add simpledrawer.new_drawer.part
tag @s add simpledrawer.new_drawer.part.base


execute if data storage simpledrawer:main temp.item.tag.simpledrawer{hopper:1b} run tag @s add simpledrawer.new_drawer.hopper
execute if data storage simpledrawer:main temp.item.tag.simpledrawer{hopper:1b} run tag @s add itemio.container.hopper




tag @s add itemio.container
tag @s add itemio.container.auto_handled_io
tag @s add itemio.container.not_vanilla_container

tag @s add global.ignore

function #itemio:calls/container/init

tp @s ~ ~ ~ ~ ~


function simpledrawer:impl/new_drawer/place/variant

function simpledrawer:impl/new_drawer/base_display