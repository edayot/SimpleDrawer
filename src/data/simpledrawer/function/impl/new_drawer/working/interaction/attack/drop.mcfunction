
summon item ~ ~ ~ {Tags:["simpledrawer.summoned"],Item:{id:"minecraft:stone",count:1},PickupDelay:2s}
execute as @e[type=item,tag=simpledrawer.summoned,limit=1,sort=nearest] run function simpledrawer:impl/new_drawer/working/interaction/attack/drop_2


