#craft detection reset
advancement revoke @s only simpledrawer:star_upgrade_craft
recipe take @s simpledrawer:star_upgrade_craft
clear @s minecraft:knowledge_book 1

#summon item with UUID
summon item ~ ~ ~ {Tags:["SD_summoned"],Item:{id:"minecraft:nether_star",Count:1b,tag:{display:{Lore:['{"translate":"simpledrawer.name","color":"blue","italic":false}'],Name:'{"translate":"simpledrawer.star_upgrade","color":"dark_grey","italic":false}'},CustomModelData:1430040,setType:"star"}}}
data modify entity @e[type=item,tag=SD_summoned,limit=1,sort=nearest] Owner set from entity @s UUID
tag @e remove SD_summoned
