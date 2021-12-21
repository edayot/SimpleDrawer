#craft detection reset
advancement revoke @s only simpledrawerdiamond_upgrade_craft
recipe take @s simpledrawerdiamond_upgrade_craft
clear @s minecraft:knowledge_book 1

#summon item with UUID
summon item ~ ~ ~ {Tags:["SD_summoned"],Item:{id:"minecraft:diamond",Count:1b,tag:{display:{Lore:['{"text":"Simple Drawer","color":"blue","italic":false}'],Name:'{"text":"Diamond Upgrade","color":"aqua","italic":false}'},CustomModelData:32768,setCount:32768}}}
data modify entity @e[type=item,tag=SD_summoned,limit=1,sort=nearest] Owner set from entity @s UUID
tag @e remove SD_summoned
