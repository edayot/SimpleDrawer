
#copy Count in a sign and set to name
scoreboard players set temp SD_tempC 0
execute store result score temp SD_tempC run data get entity @s Item.tag.data.Count
execute store result score temp2 SD_tempC run data get entity @s Item.tag.info.maxCount
execute in simpledrawer:intern run setblock 0 -64 0 oak_sign{Text1:'[{"score":{"name":"temp","objective":"SD_tempC"},"color":"white","bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false},{"text":" / ","color":"black","bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false},{"score":{"name":"temp2","objective":"SD_tempC"},"color":"white","bold":false,"italic":false,"underlined":false,"strikethrough":false,"obfuscated":false}]'} replace
execute in simpledrawer:intern run data modify entity @s Item.tag.display.Name set from block 0 -64 0 Text1
execute in simpledrawer:intern run setblock 0 -64 0 bedrock

execute at @s if entity @s[tag=SD_north] positioned ~ ~ ~0.5 run tag @e[type=glow_item_frame,tag=SD_DrawerBlock,tag=SD_north,distance=..1,sort=nearest,limit=1] add SD_selected2
execute at @s if entity @s[tag=SD_south] positioned ~ ~ ~-0.5 run tag @e[type=glow_item_frame,tag=SD_DrawerBlock,tag=SD_south,distance=..1,sort=nearest,limit=1] add SD_selected2
execute at @s if entity @s[tag=SD_east] positioned ~-0.5 ~ ~ run tag @e[type=glow_item_frame,tag=SD_DrawerBlock,tag=SD_east,distance=..1,sort=nearest,limit=1] add SD_selected2
execute at @s if entity @s[tag=SD_west] positioned ~0.5 ~ ~ run tag @e[type=glow_item_frame,tag=SD_DrawerBlock,tag=SD_west,distance=..1,sort=nearest,limit=1] add SD_selected2

#say @e[type=glow_item_frame,tag=SD_DrawerBlock,sort=nearest,limit=1]
#execute at @s run tellraw @p {"nbt":"Pos","entity":"@e[type=glow_item_frame,tag=SD_DrawerBlock,sort=nearest,limit=1]"}
#execute at @s run tellraw @p {"nbt":"Pos","entity":"@s"}



scoreboard players set model SD_tempC 1430000
execute if data entity @s Item.tag.info{hopper:1} run scoreboard players add model SD_tempC 2
execute if data entity @s Item.tag.info{type:"iron"} run scoreboard players add model SD_tempC 10
execute if data entity @s Item.tag.info{type:"gold"} run scoreboard players add model SD_tempC 20
execute if data entity @s Item.tag.info{type:"diamond"} run scoreboard players add model SD_tempC 30
execute if data entity @s Item.tag.info{type:"star"} run scoreboard players add model SD_tempC 40
execute if data entity @s Item.tag.info{type:"netherite"} run scoreboard players add model SD_tempC 50


execute store result entity @e[type=glow_item_frame,tag=SD_selected2,limit=1] Item.tag.CustomModelData long 1 run scoreboard players get model SD_tempC

tag @e remove SD_selected2

