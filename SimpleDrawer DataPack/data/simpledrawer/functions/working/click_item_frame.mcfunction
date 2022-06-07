

tag @s add simpledrawer.adder

execute as @e[type=glow_item_frame,tag=simpledrawer.DrawerItem,distance=..8] unless data entity @s {ItemRotation:0b} if entity @a[tag=simpledrawer.adder,distance=..7] run function simpledrawer:working/click/repart