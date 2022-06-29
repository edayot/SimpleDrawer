

scoreboard players set #count simpledrawer.io 1
function simpledrawer:drawer/working/output
data modify storage simpledrawer:io output.Slot set value 0b
data modify entity @e[tag=simpledrawer.selected_hopper,limit=1] Items append from storage simpledrawer:io output
scoreboard players set #already_extract simpledrawer.math 1
