#craft detection reset
advancement revoke @s only simpledraweriron_upgrade_craft
recipe take @s simpledraweriron_upgrade_craft
clear @s minecraft:knowledge_book 1

#summon item with UUID
summon item ~ ~ ~ {Tags:["SD_summoned"],Item:{id:"minecraft:iron_ingot",Count:1b,tag:{display:{Lore:['{"text":"Simple Drawer","color":"blue","italic":false}'],Name:'{"text":"Iron Upgrade","color":"white","italic":false}'},CustomModelData:1024,setCount:1024}}}
data modify entity @e[type=item,tag=SD_summoned,limit=1,sort=nearest] Owner set from entity @s UUID
tag @e remove SD_summoned
