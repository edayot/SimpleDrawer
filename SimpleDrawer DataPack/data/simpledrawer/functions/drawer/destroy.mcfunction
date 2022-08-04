tag @e[type=item,nbt={Item:{id:"minecraft:beehive",Count:1b},Age:0s},limit=1,sort=nearest,distance=..1] add simpledrawer.dropped_item
execute unless entity @e[type=item,tag=simpledrawer.dropped_item] run summon item ~ ~ ~ {Tags:["simpledrawer.dropped_item"],Item:{id:"minecraft:stone",Count:1b}}

execute store result score #model simpledrawer.math run data get entity @s Item.tag.CustomModelData


scoreboard players operation #test_id simpledrawer.math = @s simpledrawer.id
execute as @e[type=minecraft:glow_item_frame,tag=simpledrawer.drawer.item,distance=..1] if score @s simpledrawer.id = #test_id simpledrawer.math run function simpledrawer:drawer/destroy_item

execute if entity @s[tag=simpledrawer.north] if block ~ ~ ~-1 moving_piston run setblock ~ ~ ~-1 air
execute if entity @s[tag=simpledrawer.south] if block ~ ~ ~1 moving_piston run setblock ~ ~ ~1 air
execute if entity @s[tag=simpledrawer.east] if block ~1 ~ ~ moving_piston run setblock ~1 ~ ~ air
execute if entity @s[tag=simpledrawer.west] if block ~-1 ~ ~ moving_piston run setblock ~-1 ~ ~ air
execute as @e[type=minecraft:glow_item_frame,tag=simpledrawer.drawer.item,distance=..2] at @s run setblock ~ ~ ~ moving_piston


tag @e[type=item,tag=simpledrawer.dropped_item] remove simpledrawer.dropped_item
kill @s