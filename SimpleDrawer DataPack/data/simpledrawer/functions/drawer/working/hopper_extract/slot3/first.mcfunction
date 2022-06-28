

scoreboard players set #count simpledrawer.io 1
function simpledrawer:drawer/working/output
data modify storage simpledrawer:io output.Slot set value 3b
data modify block ~ ~ ~ Items append from storage simpledrawer:io output
scoreboard players set #already_extract simpledrawer.math 1
