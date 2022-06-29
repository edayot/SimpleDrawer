
scoreboard players set #count simpledrawer.io 1
function simpledrawer:drawer/working/output
scoreboard players set #already_extract simpledrawer.math 1
execute store result entity @e[tag=simpledrawer.selected_hopper,limit=1] Items[{Slot:0b}].Count byte -1 run data get storage simpledrawer:main temp.ItemsHopper[{Slot:0b}].Count -1.000001
