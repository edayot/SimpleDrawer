
data modify storage simpledrawer:io input set from storage simpledrawer:main temp.ItemInput
execute as @e[type=glow_item_frame,sort=nearest,predicate=!simpledrawer:not_rotated,distance=..7,tag=simpledrawer.drawer.item,limit=1] run function simpledrawer:repart/simple_fill_2
execute if data storage simpledrawer:io {success:1} run item modify entity @s weapon.mainhand simpledrawer:set_count_output