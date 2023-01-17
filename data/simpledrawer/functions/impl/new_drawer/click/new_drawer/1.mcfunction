

execute store result score #input_slot simpledrawer.io run data get storage simpledrawer:main temp.interact[1].slot
execute store result score #interact_type simpledrawer.math run data get storage simpledrawer:main temp.interact[1].type
execute store success score #filled simpledrawer.math if score @s simpledrawer.drawer.Count1 matches 1.. 

