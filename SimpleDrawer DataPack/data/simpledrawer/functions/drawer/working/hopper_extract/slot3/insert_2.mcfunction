
scoreboard players set #count simpledrawer.io 1
function simpledrawer:drawer/working/output
scoreboard players set #already_extract simpledrawer.math 1
execute store result block ~ ~ ~ Items[{Slot:3b}].Count byte -1 run data get storage simpledrawer:main temp.ItemsHopper[{Slot:3b}].Count -1.000001
