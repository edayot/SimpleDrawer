#craft detection reset
advancement revoke @s only simpledrawer:downgrade_wand_craft
recipe take @s simpledrawer:downgrade_wand_craft
clear @s minecraft:knowledge_book 1

#summon item with UUID
summon item ~ ~ ~ {Tags:["SD_summoned"],Item:{id:"minecraft:stick",Count:1b,tag:{display:{Lore:['{"translate":"simpledrawer.name","color":"blue","italic":false}'],Name:'{"translate":"simpledrawer.downgrade_wrench","color":"white","italic":false}'},CustomModelData:1374,downgrade:1b}}}
data modify entity @e[type=item,tag=SD_summoned,limit=1,sort=nearest] Owner set from entity @s UUID
tag @e remove SD_summoned