#craft detection reset
advancement revoke @s only simpledrawer:netherite_upgrade_craft
advancement grant @s only simpledrawer:upgrade/netherite
recipe take @s simpledrawer:netherite_upgrade_craft
clear @s minecraft:knowledge_book 1

#summon item with UUID
summon item ~ ~ ~ {Tags:["SD_summoned"],Item:{id:"minecraft:netherite_ingot",Count:1b,tag:{display:{Lore:['{"translate":"simpledrawer.name","color":"blue","italic":false}'],Name:'{"translate":"simpledrawer.netherite_upgrade","color":"black","italic":false}'},CustomModelData:1430050,setType:"netherite"}}}
data modify entity @e[type=item,tag=SD_summoned,limit=1,sort=nearest] Owner set from entity @s UUID
tag @e remove SD_summoned
