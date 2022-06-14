scoreboard players set #already simpledrawer.math 1


execute as @e[type=glow_item_frame,sort=nearest,predicate=!simpledrawer:not_rotated,distance=..7,tag=simpledrawer.drawer.item,limit=1,tag=simpledrawer.drawer.filled] run function simpledrawer:repart/simple_unfill_2
execute if data storage simpledrawer:io {success:1} run function simpledrawer:repart/simple_unfill_3