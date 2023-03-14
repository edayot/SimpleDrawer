
summon item ~ ~ ~ {Tags:["simpledrawer.summoned"],Item:{id:"minecraft:stone",Count:1b}}
execute as @e[type=item,tag=simpledrawer.summoned,limit=1,sort=nearest] run function simpledrawer:impl/new_drawer/compacting/interaction/attack/drop_2

