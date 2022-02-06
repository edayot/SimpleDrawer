execute at @p[tag=SD_adder] run summon item ~ ~ ~ {Tags:["SD_summoned"],Item:{id:"minecraft:stone",Count:1b}}
execute at @p[tag=SD_adder] run data modify entity @e[type=item,tag=SD_summoned,limit=1,sort=nearest] Item set from storage simpledrawer:temp ItemsNBT.Upgrades.iron
execute at @p[tag=SD_adder] run data modify entity @e[type=item,tag=SD_summoned,limit=1,sort=nearest] Owner set from entity @p[tag=SD_adder] UUID
tag @e remove SD_summoned
execute at @s run playsound minecraft:block.note_block.harp master @s ~ ~ ~ 1 0.8

data modify entity @s Item.tag.info.type set value "wood"
function simpledrawer:working/set_max_count
function simpledrawer:working/display

tag @s add SD_upgrade