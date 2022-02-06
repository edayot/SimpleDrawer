#craft detection reset
advancement revoke @s only simpledrawer:hopper_upgrade_craft
recipe take @s simpledrawer:hopper_upgrade_craft
clear @s minecraft:knowledge_book 1

#summon item with UUID
summon item ~ ~ ~ {Tags:["SD_summoned"],Item:{id:"minecraft:flint",Count:1b,tag:{display:{Lore:['{"translate":"simpledrawer.name","color":"blue","italic":false}'],Name:'{"translate":"simpledrawer.hopper_upgrade","color":"green","italic":false}'},CustomModelData:1430020,setType:"hopper"}}}
data modify entity @e[type=item,tag=SD_summoned,limit=1,sort=nearest] Owner set from entity @s UUID
tag @e remove SD_summoned
