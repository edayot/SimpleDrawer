

tag @s add simpledrawer.block
tag @s add simpledrawer.drawer.item
tag @s add simpledrawer.drawer



data modify entity @s Item set from storage simpledrawer:main temp.ItemPlaced

execute if data storage simpledrawer:main temp.ItemPlaced.tag.simpledrawer.Item run tag @s add simpledrawer.drawer.filled
execute if data storage simpledrawer:main temp.ItemPlaced.tag.simpledrawer{hopper:1b} run tag @s add simpledrawer.drawer.hopper

scoreboard players set @s simpledrawer.drawer.Count 0
execute store result score @s simpledrawer.drawer.Count run data get storage simpledrawer:main temp.ItemPlaced.tag.simpledrawer.Item.Count

function simpledrawer:impl/drawer/working/set_maxcount
function simpledrawer:impl/drawer/working/display/count

function simpledrawer:impl/drawer/working/display/block

scoreboard players set #check_place simpledrawer.math 0
execute if block ~ ~ ~ #simpledrawer:air run scoreboard players set #check_place simpledrawer.math 1
execute if score #check_place simpledrawer.math matches 1 run setblock ~ ~ ~ moving_piston destroy
