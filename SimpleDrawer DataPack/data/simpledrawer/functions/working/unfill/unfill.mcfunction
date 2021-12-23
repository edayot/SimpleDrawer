#Copy item to unfill and max to Count:64b
execute store result score nb SD_tempC run data get entity @s Item.tag.data.Count
data modify storage simpledrawer:temp ItemUnfilled set from entity @s Item.tag.data
execute if score nb SD_tempC matches 65.. run data modify storage simpledrawer:temp ItemUnfilled.Count set value 64b





#All Item Drop
execute at @s at @p[tag=SD_adder] run summon item ~ ~ ~ {Tags:["SD_summoned"],Item:{id:"minecraft:stone",Count:1b}}
data modify entity @e[type=item,tag=SD_summoned,limit=1] Item set from storage simpledrawer:temp ItemUnfilled
data modify entity @e[type=item,tag=SD_summoned,limit=1] Owner set from entity @p[tag=SD_adder] UUID


#Change Drawer Count of items
execute if score nb SD_tempC matches ..64 run function simpledrawer:working/unfill/inf64
execute if score nb SD_tempC matches 65.. run function simpledrawer:working/unfill/sup65
function simpledrawer:working/display


tag @e remove SD_summoned
#data modify entity @s ItemRotation set value 0b