execute at @p[tag=simpledrawer.adder] run summon item ~ ~ ~ {Tags:["simpledrawer.summoned"],Item:{id:"minecraft:stone",Count:1b}}
execute at @p[tag=simpledrawer.adder] run data modify entity @e[type=item,tag=simpledrawer.summoned,limit=1,sort=nearest] Item set from storage simpledrawer:temp ItemsNBT.Upgrades.gold
execute at @p[tag=simpledrawer.adder] run data modify entity @e[type=item,tag=simpledrawer.summoned,limit=1,sort=nearest] Owner set from entity @p[tag=simpledrawer.adder] UUID
tag @e[type=item,tag=simpledrawer.summoned] remove simpledrawer.summoned
execute at @s run playsound minecraft:block.note_block.harp master @s ~ ~ ~ 1 0.8

data modify entity @s Item.tag.info.type set value "iron"
function simpledrawer:working/set_max_count
function simpledrawer:working/display/drawer_block

tag @s add simpledrawer.upgrade