tag @s remove simpledrawer.summoned
function simpledrawer:impl/new_drawer/regen_books

data modify entity @s Item.tag.simpledrawer.type set value "wood"
data modify entity @s Item.tag.simpledrawer set from storage simpledrawer:main temp.ItemPlaced.tag.simpledrawer

execute if data storage simpledrawer:main temp.ItemPlaced.tag.simpledrawer{hopper:1b} run tag @s add itemio.container.hopper


scoreboard players set @s simpledrawer.drawer.Count0 0
execute store result score @s simpledrawer.drawer.Count0 run data get storage simpledrawer:main temp.ItemPlaced.tag.simpledrawer.Item0.Count

scoreboard players set @s simpledrawer.drawer.Count1 0
execute store result score @s simpledrawer.drawer.Count1 run data get storage simpledrawer:main temp.ItemPlaced.tag.simpledrawer.Item1.Count

scoreboard players set @s simpledrawer.drawer.Count2 0
execute store result score @s simpledrawer.drawer.Count2 run data get storage simpledrawer:main temp.ItemPlaced.tag.simpledrawer.Item2.Count

scoreboard players set @s simpledrawer.drawer.Count3 0
execute store result score @s simpledrawer.drawer.Count3 run data get storage simpledrawer:main temp.ItemPlaced.tag.simpledrawer.Item3.Count

scoreboard players set @s simpledrawer.drawer.Count4 0
execute store result score @s simpledrawer.drawer.Count4 run data get storage simpledrawer:main temp.ItemPlaced.tag.simpledrawer.Item4.Count

scoreboard players set @s simpledrawer.drawer.Count5 0
execute store result score @s simpledrawer.drawer.Count5 run data get storage simpledrawer:main temp.ItemPlaced.tag.simpledrawer.Item5.Count


scoreboard players set @s simpledrawer.drawer.nb_enabled 1
execute store result score @s simpledrawer.drawer.nb_enabled run data get storage simpledrawer:main temp.ItemPlaced.tag.simpledrawer.nb_enabled


function simpledrawer:impl/new_drawer/working/set_maxcount


function simpledrawer:impl/new_drawer/working/summon/repart

function simpledrawer:impl/new_drawer/working/display/repart


tag @s add simpledrawer.block
tag @s add simpledrawer.new_drawer

tag @s add itemio.container
tag @s add itemio.container.auto_handled_io


tag @s add global.ignore

function #itemio:calls/container/init
