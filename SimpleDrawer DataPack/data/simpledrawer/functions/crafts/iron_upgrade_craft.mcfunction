#craft detection reset
advancement revoke @s only simpledrawer:iron_upgrade_craft
advancement grant @s only simpledrawer:upgrade/iron
recipe take @s simpledrawer:iron_upgrade_craft
clear @s minecraft:knowledge_book 1

#summon item with UUID
summon item ~ ~ ~ {Tags:["SD_summoned"],Item:{id:"minecraft:iron_ingot",Count:1b,tag:{display:{Lore:['{"translate":"simpledrawer.name","color":"blue","italic":false}'],Name:'{"translate":"simpledrawer.iron_upgrade","color":"white","italic":false}'},CustomModelData:1430010,setType:"iron"}}}
data modify entity @e[type=item,tag=SD_summoned,limit=1,sort=nearest] Owner set from entity @s UUID
tag @e remove SD_summoned
