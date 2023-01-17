tag @s remove simpledrawer.summoned
function simpledrawer:impl/new_drawer/regen_books


data modify entity @s Item.tag.simpledrawer set from storage simpledrawer:main temp.ItemPlaced.tag.simpledrawer

execute if data storage simpledrawer:main temp.ItemPlaced.tag.simpledrawer{hopper:1b} run tag @s add itemio.container.hopper


scoreboard players set @s simpledrawer.drawer.Count0 0
scoreboard players set @s simpledrawer.drawer.maxCount0 256

scoreboard players set @s simpledrawer.drawer.Count1 0
scoreboard players set @s simpledrawer.drawer.maxCount1 256

scoreboard players set @s simpledrawer.drawer.Count2 0
scoreboard players set @s simpledrawer.drawer.maxCount2 256

scoreboard players set @s simpledrawer.drawer.Count3 0
scoreboard players set @s simpledrawer.drawer.maxCount3 256

scoreboard players set @s simpledrawer.drawer.Count4 0
scoreboard players set @s simpledrawer.drawer.maxCount4 256

scoreboard players set @s simpledrawer.drawer.Count5 0
scoreboard players set @s simpledrawer.drawer.maxCount5 256

scoreboard players set @s simpledrawer.drawer.nb_enabled 1
data modify entity @s Item.tag.simpledrawer.interact set value [{type:0,slot:0},{type:0,slot:0},{type:1,slot:0},{type:0,slot:0},{type:0,slot:0},{type:1,slot:0}]

tag @s add simpledrawer.block
tag @s add simpledrawer.new_drawer

tag @s add itemio.container
tag @s add itemio.container.auto_handled_io


tag @s add global.ignore

function #itemio:calls/container/init
