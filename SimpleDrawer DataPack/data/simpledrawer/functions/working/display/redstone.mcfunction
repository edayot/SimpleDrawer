scoreboard players set temp simpledrawer.tempC 0
execute store result score temp simpledrawer.tempC run data get entity @s Item.tag.data.Count
execute store result score temp2 simpledrawer.tempC run data get entity @s Item.tag.info.maxCount

tag @s add simpledrawer.selected
scoreboard players operation #predicate simpledrawer.tempC = @s simpledrawer.drawer_id
execute at @s run tag @e[y=0,type=glow_item_frame,tag=simpledrawer.DrawerBlock,predicate=simpledrawer:as_same_drawer_id] add simpledrawer.selected2
#execute unless entity @e[type=glow_item_frame,tag=simpledrawer.selected2] at @s if entity @s[tag=simpledrawer.north] positioned ~ ~ ~0.5 run tag @e[type=glow_item_frame,tag=simpledrawer.DrawerBlock,tag=simpledrawer.north,distance=..0.5,sort=nearest,limit=1] add simpledrawer.selected2
#execute unless entity @e[type=glow_item_frame,tag=simpledrawer.selected2] at @s if entity @s[tag=simpledrawer.south] positioned ~ ~ ~-0.5 run tag @e[type=glow_item_frame,tag=simpledrawer.DrawerBlock,tag=simpledrawer.south,distance=..0.5,sort=nearest,limit=1] add simpledrawer.selected2
#execute unless entity @e[type=glow_item_frame,tag=simpledrawer.selected2] at @s if entity @s[tag=simpledrawer.east] positioned ~-0.5 ~ ~ run tag @e[type=glow_item_frame,tag=simpledrawer.DrawerBlock,tag=simpledrawer.east,distance=..0.5,sort=nearest,limit=1] add simpledrawer.selected2
#execute unless entity @e[type=glow_item_frame,tag=simpledrawer.selected2] at @s if entity @s[tag=simpledrawer.west] positioned ~0.5 ~ ~ run tag @e[type=glow_item_frame,tag=simpledrawer.DrawerBlock,tag=simpledrawer.west,distance=..0.5,sort=nearest,limit=1] add simpledrawer.selected2

#say @e[type=glow_item_frame,tag=simpledrawer.DrawerBlock,sort=nearest,limit=1]
#execute at @s run tellraw @p {"nbt":"Pos","entity":"@e[type=glow_item_frame,tag=simpledrawer.DrawerBlock,sort=nearest,limit=1]"}
#execute at @s run tellraw @p {"nbt":"Pos","entity":"@s"}

#Redstone compatibility
execute if entity @s[tag=simpledrawer.north] run function simpledrawer:working/display/redstone/north
execute if entity @s[tag=simpledrawer.south] run function simpledrawer:working/display/redstone/south
execute if entity @s[tag=simpledrawer.east] run function simpledrawer:working/display/redstone/east
execute if entity @s[tag=simpledrawer.west] run function simpledrawer:working/display/redstone/west

tag @e[type=glow_item_frame,tag=simpledrawer.selected2] remove simpledrawer.selected2
tag @s remove simpledrawer.selected
