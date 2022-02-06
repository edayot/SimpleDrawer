# executed as our "marker" anywhere in the chunk
# "simpledrawer.tempC" is a dummy objective

tag @s remove global.ignore

# Constant chunk width
scoreboard players set #16 simpledrawer.tempC 16

# Align marker to X chunk border
execute store result score #pos simpledrawer.tempC run data get entity @s Pos[0]
scoreboard players operation #pos simpledrawer.tempC /= #16 simpledrawer.tempC
execute store result entity @s Pos[0] double 16 run scoreboard players get #pos simpledrawer.tempC

# Align marker to Z chunk border
execute store result score #pos simpledrawer.tempC run data get entity @s Pos[2]
scoreboard players operation #pos simpledrawer.tempC /= #16 simpledrawer.tempC
execute store result entity @s Pos[2] double 16 run scoreboard players get #pos simpledrawer.tempC

# Align marker to lowest Y block
data modify entity @s Pos[1] set value -64.0d

# Check region
execute at @s unless entity @e[tag=global.forceload,dx=15,dy=319,dz=15] run forceload remove ~ ~

kill @s