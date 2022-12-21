scoreboard players set #success simpledrawer.io 1
execute store result score #count_input simpledrawer.math run data get storage simpledrawer:io input.Count
execute if score #count_input simpledrawer.math matches 1.. run function simpledrawer:impl/drawer/working/fill/fill
execute if score #count_input simpledrawer.math matches 0 run scoreboard players set #nothing_changed simpledrawer.io 1
