

execute store result score #input_slot simpledrawer.io run data get storage simpledrawer:main temp.interact[4].slot
execute store result score #interact_type simpledrawer.math run data get storage simpledrawer:main temp.interact[4].type
execute store success score #filled simpledrawer.math if score @s simpledrawer.drawer.Count4 matches 1.. 

