scoreboard objectives add SD_tempC dummy

scoreboard objectives add SD_sneak minecraft.custom:minecraft.sneak_time
scoreboard objectives add SD_click dummy
scoreboard objectives add SD_time dummy


scoreboard objectives add SD_Place minecraft.used:minecraft.furnace


execute in simpledrawer:intern run forceload add 0 0
scoreboard players set 64 SD_tempC 64

data modify storage simpledrawer:temp Drawers.wood set value 256
data modify storage simpledrawer:temp Drawers.iron set value 2048
data modify storage simpledrawer:temp Drawers.gold set value 8192
data modify storage simpledrawer:temp Drawers.diamond set value 65536
data modify storage simpledrawer:temp Drawers.star set value 1048576
data modify storage simpledrawer:temp Drawers.netherite set value 1073741824

function simpledrawer:print_version