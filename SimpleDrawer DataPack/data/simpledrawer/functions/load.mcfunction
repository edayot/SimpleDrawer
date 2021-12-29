scoreboard objectives add SD_tempC dummy

scoreboard objectives add SD_sneak minecraft.custom:minecraft.sneak_time
scoreboard objectives add SD_time dummy


execute in simpledrawer:intern run forceload add 0 0
scoreboard players set 64 SD_tempC 64

data modify storage simpledrawer:temp Drawers.wood set value 256L
data modify storage simpledrawer:temp Drawers.iron set value 2048L
data modify storage simpledrawer:temp Drawers.gold set value 8192L
data modify storage simpledrawer:temp Drawers.diamond set value 65536L
data modify storage simpledrawer:temp Drawers.star set value 1048576L
data modify storage simpledrawer:temp Drawers.netherite set value 1073741824L

function simpledrawer:print_version