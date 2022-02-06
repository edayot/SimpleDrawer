execute at @p[tag=simpledrawer.adder] run summon item ~ ~ ~ {Tags:["simpledrawer.summoned"],Item:{id:"minecraft:stone",Count:1b}}
execute at @p[tag=simpledrawer.adder] run data modify entity @e[type=item,tag=simpledrawer.summoned,limit=1,sort=nearest] Item set from storage simpledrawer:temp ItemsNBT.Upgrades.hopper
execute at @p[tag=simpledrawer.adder] run data modify entity @e[type=item,tag=simpledrawer.summoned,limit=1,sort=nearest] Owner set from entity @p[tag=simpledrawer.adder] UUID
tag @e remove simpledrawer.summoned
execute at @s run playsound minecraft:block.note_block.harp master @s ~ ~ ~ 1 0.8

data modify entity @s Item.tag.info.hopper set value 0

execute at @s if entity @s[tag=simpledrawer.north] positioned ~ ~ ~0.5 run tag @e[type=glow_item_frame,tag=simpledrawer.DrawerBlock,tag=simpledrawer.north,distance=..1,sort=nearest,limit=1] add simpledrawer.selected2
execute at @s if entity @s[tag=simpledrawer.south] positioned ~ ~ ~-0.5 run tag @e[type=glow_item_frame,tag=simpledrawer.DrawerBlock,tag=simpledrawer.south,distance=..1,sort=nearest,limit=1] add simpledrawer.selected2
execute at @s if entity @s[tag=simpledrawer.east] positioned ~-0.5 ~ ~ run tag @e[type=glow_item_frame,tag=simpledrawer.DrawerBlock,tag=simpledrawer.east,distance=..1,sort=nearest,limit=1] add simpledrawer.selected2
execute at @s if entity @s[tag=simpledrawer.west] positioned ~0.5 ~ ~ run tag @e[type=glow_item_frame,tag=simpledrawer.DrawerBlock,tag=simpledrawer.west,distance=..1,sort=nearest,limit=1] add simpledrawer.selected2
tag @e[type=glow_item_frame,tag=simpledrawer.selected2,limit=1] remove simpledrawer.hopper

function simpledrawer:working/display
tag @e remove simpledrawer.selected2

tag @s add simpledrawer.upgrade
