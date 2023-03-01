
scoreboard players operation @s simpledrawer.new_drawer.id = #global simpledrawer.new_drawer.id


data modify storage simpledrawer:main temp.item set value {id:"minecraft:furnace",Count:1b,tag:{CustomModelData:1430200,simpledrawer:{}}}

data modify storage simpledrawer:main temp.item.tag.simpledrawer set from storage simpledrawer:main temp.simpledrawer

data modify entity @s item set from storage simpledrawer:main temp.item

tag @s add simpledrawer.block
tag @s add simpledrawer.new_drawer.base
tag @s add simpledrawer.new_drawer.part
tag @s add simpledrawer.new_drawer.part.base



tag @s add itemio.container
tag @s add itemio.container.auto_handled_io
tag @s add itemio.container.not_vanilla_container

tag @s add global.ignore

function #itemio:calls/container/init

tp @s ~ ~ ~ ~180 ~
data merge entity @s {brightness:{block:15,sky:15},transformation:{scale:[2.01f,2.01f,2.01f]}}