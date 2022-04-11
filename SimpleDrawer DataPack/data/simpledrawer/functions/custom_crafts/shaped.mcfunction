
#Drawer
execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if data storage smithed.crafter:main root.temp{crafting_input:{0:[{Slot:0b,item_tag:["#minecraft:planks"]},{Slot:1b,id:"minecraft:stick"},{Slot:2b,item_tag:["#minecraft:planks"]}],1:[{Slot:0b,id:"minecraft:stick"},{Slot:1b,id:"minecraft:barrel"},{Slot:2b,id:"minecraft:stick"}],2:[{Slot:0b,item_tag:["#minecraft:planks"]},{Slot:1b,id:"minecraft:iron_nugget"},{Slot:2b,item_tag:["#minecraft:planks"]}]}} run loot replace block ~ ~ ~ container.16 loot simpledrawer:items/drawer

#Iron
execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if data storage smithed.crafter:main root.temp{crafting_input:{0:[{Slot:0b,id:"minecraft:stick"},{Slot:1b,id:"minecraft:stick"},{Slot:2b,id:"minecraft:stick"}],1:[{Slot:0b,id:"minecraft:iron_ingot"},{Slot:1b,item_tag:["#minecraft:planks"]},{Slot:2b,id:"minecraft:iron_ingot"}],2:[{Slot:0b,id:"minecraft:iron_ingot"},{Slot:1b,item_tag:["#minecraft:planks"]},{Slot:2b,id:"minecraft:iron_ingot"}]}} run loot replace block ~ ~ ~ container.16 loot simpledrawer:items/upgrade/iron

#Gold
execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if data storage smithed.crafter:main root.temp{crafting_input:{0:[{Slot:0b,id:"minecraft:stick"},{Slot:1b,id:"minecraft:stick"},{Slot:2b,id:"minecraft:stick"}],1:[{Slot:0b,id:"minecraft:gold_ingot"},{Slot:1b,tag:{ctc:{from:"airdox_:simpledrawer",id:"iron_upgrade"}}},{Slot:2b,id:"minecraft:gold_ingot"}],2:[{Slot:0b,id:"minecraft:gold_ingot"},{Slot:1b,id:"minecraft:air"},{Slot:2b,id:"minecraft:gold_ingot"}]}} run loot replace block ~ ~ ~ container.16 loot simpledrawer:items/upgrade/gold

#Diamond
execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if data storage smithed.crafter:main root.temp{crafting_input:{0:[{Slot:0b,id:"minecraft:stick"},{Slot:1b,id:"minecraft:stick"},{Slot:2b,id:"minecraft:stick"}],1:[{Slot:0b,id:"minecraft:diamond"},{Slot:1b,tag:{ctc:{from:"airdox_:simpledrawer",id:"gold_upgrade"}}},{Slot:2b,id:"minecraft:diamond"}],2:[{Slot:0b,id:"minecraft:diamond"},{Slot:1b,id:"minecraft:air"},{Slot:2b,id:"minecraft:diamond"}]}} run loot replace block ~ ~ ~ container.16 loot simpledrawer:items/upgrade/diamond

#Star
execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if data storage smithed.crafter:main root.temp{crafting_input:{0:[{Slot:0b,id:"minecraft:stick"},{Slot:1b,id:"minecraft:diamond"},{Slot:2b,id:"minecraft:stick"}],1:[{Slot:0b,id:"minecraft:iron_ingot"},{Slot:1b,tag:{ctc:{from:"airdox_:simpledrawer",id:"diamond_upgrade"}}},{Slot:2b,id:"minecraft:iron_ingot"}],2:[{Slot:0b,id:"minecraft:iron_ingot"},{Slot:1b,id:"minecraft:nether_star"},{Slot:2b,id:"minecraft:iron_ingot"}]}} run loot replace block ~ ~ ~ container.16 loot simpledrawer:items/upgrade/star

#Netherite
execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if data storage smithed.crafter:main root.temp{crafting_input:{0:[{Slot:0b,id:"minecraft:nether_star"},{Slot:1b,id:"minecraft:nether_star"},{Slot:2b,id:"minecraft:nether_star"}],1:[{Slot:0b,id:"minecraft:netherite_ingot"},{Slot:1b,tag:{ctc:{from:"airdox_:simpledrawer",id:"star_upgrade"}}},{Slot:2b,id:"minecraft:netherite_ingot"}],2:[{Slot:0b,id:"minecraft:netherite_ingot"},{Slot:1b,id:"minecraft:netherite_ingot"},{Slot:2b,id:"minecraft:netherite_ingot"}]}} run loot replace block ~ ~ ~ container.16 loot simpledrawer:items/upgrade/netherite

#Wrench
execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if data storage smithed.crafter:main root.temp{crafting_input:{0:[{Slot:0b,id:"minecraft:air"},{Slot:1b,id:"minecraft:iron_nugget"},{Slot:2b,tag:{ctc:{from:"airdox_:simpledrawer",id:"iron_upgrade"}}}],1:[{Slot:0b,id:"minecraft:air"},{Slot:1b,id:"minecraft:iron_ingot"},{Slot:2b,id:"minecraft:iron_nugget"}],2:[{Slot:0b,id:"minecraft:iron_ingot"},{Slot:1b,id:"minecraft:air"},{Slot:2b,id:"minecraft:air"}]}} run loot replace block ~ ~ ~ container.16 loot simpledrawer:items/wrench

#Guide
execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if data storage smithed.crafter:main root.temp{crafting_input:{0:[{Slot:0b,id:"minecraft:barrel"},{Slot:1b,id:"minecraft:iron_nugget"},{Slot:2b,id:"minecraft:air"}],1:[{Slot:0b,id:"minecraft:book"},{Slot:1b,item_tag:["#minecraft:planks"]},{Slot:2b,id:"minecraft:air"}]}} if data storage smithed.crafter:main root.temp{crafting_input:{2:[]}} run loot replace block ~ ~ ~ container.16 loot simpledrawer:items/guide
















