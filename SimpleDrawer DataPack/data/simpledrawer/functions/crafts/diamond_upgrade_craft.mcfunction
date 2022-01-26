#craft detection reset
advancement revoke @s only simpledrawer:diamond_upgrade_craft
recipe take @s simpledrawer:diamond_upgrade_craft
clear @s minecraft:knowledge_book 1

#summon item with UUID
summon item ~ ~ ~ {Tags:["SD_summoned"],Item:{id:"minecraft:diamond",Count:1b,tag:{display:{Lore:['{"translate":"simpledrawer.name","color":"blue","italic":false}'],Name:'{"translate":"simpledrawer.diamond_upgrade","color":"aqua","italic":false}'},CustomModelData:1430030,setType:"diamond"}}}
data modify entity @e[type=item,tag=SD_summoned,limit=1,sort=nearest] Owner set from entity @s UUID
tag @e remove SD_summoned
