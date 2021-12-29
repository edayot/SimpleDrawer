


#Copy item to unfill and max to Count:64b
execute store result score nb SD_tempC run data get entity @s Item.tag.data.Count
data remove storage simpledrawer:temp ItemUnfilled
data modify storage simpledrawer:temp ItemUnfilled set from entity @s Item.tag.data

#test stack 

execute if score nb SD_tempC matches 65.. run data modify storage simpledrawer:temp ItemUnfilled.Count set value 64b
execute if data entity @s Item.tag.info{stack1:0b,stack16:1b} if score nb SD_tempC matches 17.. run data modify storage simpledrawer:temp ItemUnfilled.Count set value 16b
execute if data entity @s Item.tag.info{stack1:1b,stack16:0b} if score nb SD_tempC matches 1.. run data modify storage simpledrawer:temp ItemUnfilled.Count set value 1b



#All Item Drop
execute at @s at @p[tag=SD_adder] run summon item ~ ~ ~ {Tags:["SD_summoned"],Item:{id:"minecraft:stone",Count:1b}}
data modify entity @e[type=item,tag=SD_summoned,limit=1] Item set from storage simpledrawer:temp ItemUnfilled
data modify entity @e[type=item,tag=SD_summoned,limit=1] Owner set from entity @p[tag=SD_adder] UUID


#Change Drawer Count of items
execute if data entity @s Item.tag.info{stack1:0b,stack16:0b} if score nb SD_tempC matches ..64 run function simpledrawer:working/unfill/inf64
execute if data entity @s Item.tag.info{stack1:0b,stack16:0b} if score nb SD_tempC matches 65.. run function simpledrawer:working/unfill/sup65

execute if data entity @s Item.tag.info{stack1:0b,stack16:1b} if score nb SD_tempC matches ..16 run function simpledrawer:working/unfill/inf64
execute if data entity @s Item.tag.info{stack1:0b,stack16:1b} if score nb SD_tempC matches 17.. run function simpledrawer:working/unfill/sup65

execute if data entity @s Item.tag.info{stack1:1b,stack16:0b} if score nb SD_tempC matches ..1 run function simpledrawer:working/unfill/inf64
execute if data entity @s Item.tag.info{stack1:1b,stack16:0b} if score nb SD_tempC matches 2.. run function simpledrawer:working/unfill/sup65
function simpledrawer:working/display

execute unless data entity @s Item.tag.info.stack1 if score nb SD_tempC matches ..64 run function simpledrawer:working/unfill/inf64
execute unless data entity @s Item.tag.info.stack1 if score nb SD_tempC matches 65.. run function simpledrawer:working/unfill/sup65

tag @e remove SD_summoned

#data modify entity @s ItemRotation set value 0b