# @public
#Drawer

#Iron
execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if data storage smithed.crafter:main root.temp{crafting_input:{0:[{Slot:0b,id:"minecraft:stick"},{Slot:1b,id:"minecraft:stick"},{Slot:2b,id:"minecraft:stick"}],1:[{Slot:0b,id:"minecraft:iron_ingot"},{Slot:1b,item_tag:["#minecraft:planks"]},{Slot:2b,id:"minecraft:iron_ingot"}],2:[{Slot:0b,id:"minecraft:iron_ingot"},{Slot:1b,item_tag:["#minecraft:planks"]},{Slot:2b,id:"minecraft:iron_ingot"}]}} run loot replace block ~ ~ ~ container.16 loot simpledrawer:impl/items/iron_upgrade

#Gold
execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if data storage smithed.crafter:main root.temp{crafting_input:{0:[{Slot:0b,id:"minecraft:stick"},{Slot:1b,id:"minecraft:stick"},{Slot:2b,id:"minecraft:stick"}],1:[{Slot:0b,id:"minecraft:gold_ingot"},{Slot:1b,tag:{ctc:{from:"airdox_:simpledrawer",id:"iron_upgrade"}}},{Slot:2b,id:"minecraft:gold_ingot"}],2:[{Slot:0b,id:"minecraft:gold_ingot"},{Slot:1b,id:"minecraft:air"},{Slot:2b,id:"minecraft:gold_ingot"}]}} run loot replace block ~ ~ ~ container.16 loot simpledrawer:impl/items/gold_upgrade

#Diamond
execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if data storage smithed.crafter:main root.temp{crafting_input:{0:[{Slot:0b,id:"minecraft:stick"},{Slot:1b,id:"minecraft:stick"},{Slot:2b,id:"minecraft:stick"}],1:[{Slot:0b,id:"minecraft:diamond"},{Slot:1b,tag:{ctc:{from:"airdox_:simpledrawer",id:"gold_upgrade"}}},{Slot:2b,id:"minecraft:diamond"}],2:[{Slot:0b,id:"minecraft:diamond"},{Slot:1b,id:"minecraft:air"},{Slot:2b,id:"minecraft:diamond"}]}} run loot replace block ~ ~ ~ container.16 loot simpledrawer:impl/items/diamond_upgrade

#Star
execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if data storage smithed.crafter:main root.temp{crafting_input:{0:[{Slot:0b,id:"minecraft:stick"},{Slot:1b,id:"minecraft:diamond"},{Slot:2b,id:"minecraft:stick"}],1:[{Slot:0b,id:"minecraft:iron_ingot"},{Slot:1b,tag:{ctc:{from:"airdox_:simpledrawer",id:"diamond_upgrade"}}},{Slot:2b,id:"minecraft:iron_ingot"}],2:[{Slot:0b,id:"minecraft:iron_ingot"},{Slot:1b,id:"minecraft:nether_star"},{Slot:2b,id:"minecraft:iron_ingot"}]}} run loot replace block ~ ~ ~ container.16 loot simpledrawer:impl/items/star_upgrade

#Netherite
execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if data storage smithed.crafter:main root.temp{crafting_input:{0:[{Slot:0b,id:"minecraft:nether_star"},{Slot:1b,id:"minecraft:nether_star"},{Slot:2b,id:"minecraft:nether_star"}],1:[{Slot:0b,id:"minecraft:netherite_ingot"},{Slot:1b,tag:{ctc:{from:"airdox_:simpledrawer",id:"star_upgrade"}}},{Slot:2b,id:"minecraft:netherite_ingot"}],2:[{Slot:0b,id:"minecraft:netherite_ingot"},{Slot:1b,id:"minecraft:netherite_ingot"},{Slot:2b,id:"minecraft:netherite_ingot"}]}} run loot replace block ~ ~ ~ container.16 loot simpledrawer:impl/items/netherite_upgrade

#Wrench
execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if data storage smithed.crafter:main root.temp{crafting_input:{0:[{Slot:0b,id:"minecraft:air"},{Slot:1b,id:"minecraft:iron_nugget"},{Slot:2b,tag:{ctc:{from:"airdox_:simpledrawer",id:"iron_upgrade"}}}],1:[{Slot:0b,id:"minecraft:air"},{Slot:1b,id:"minecraft:iron_ingot"},{Slot:2b,id:"minecraft:iron_nugget"}],2:[{Slot:0b,id:"minecraft:iron_ingot"},{Slot:1b,id:"minecraft:air"},{Slot:2b,id:"minecraft:air"}]}} run loot replace block ~ ~ ~ container.16 loot simpledrawer:impl/items/downgrade_wrench

#Guide
execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if data storage smithed.crafter:main root.temp{crafting_input:{0:[{Slot:0b,id:"minecraft:barrel"},{Slot:1b,id:"minecraft:iron_nugget"},{Slot:2b,id:"minecraft:air"}],1:[{Slot:0b,id:"minecraft:book"},{Slot:1b,item_tag:["#minecraft:planks"]},{Slot:2b,id:"minecraft:air"}]}} if data storage smithed.crafter:main root.temp{crafting_input:{2:[]}} run loot replace block ~ ~ ~ container.16 loot simpledrawer:impl/items/guide

#Hopper
execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if data storage smithed.crafter:main root.temp{crafting_input:{0:[{Slot:0b,id:"minecraft:stick"},{Slot:1b,id:"minecraft:stick"},{Slot:2b,id:"minecraft:stick"}],1:[{Slot:0b,id:"minecraft:hopper"},{Slot:1b,tag:{ctc:{from:"airdox_:simpledrawer",id:"iron_upgrade"}}},{Slot:2b,id:"minecraft:hopper"}],2:[{Slot:0b,id:"minecraft:redstone"},{Slot:1b,id:"minecraft:air"},{Slot:2b,id:"minecraft:redstone"}]}} run loot replace block ~ ~ ~ container.16 loot simpledrawer:impl/items/hopper_upgrade




#New Drawer
execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if data storage smithed.crafter:main root.temp{crafting_input:{0:[{Slot:0b,item_tag:["#minecraft:planks"]},{Slot:1b,id:"minecraft:stick"},{Slot:2b,item_tag:["#minecraft:planks"]}],1:[{Slot:0b,id:"minecraft:stick"},{Slot:1b,id:"minecraft:iron_nugget"},{Slot:2b,id:"minecraft:stick"}],2:[{Slot:0b,item_tag:["#minecraft:planks"]},{Slot:1b,id:"minecraft:barrel"},{Slot:2b,item_tag:["#minecraft:planks"]}]}} run function simpledrawer:impl/crafts/new_drawer
execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if data storage smithed.crafter:main root.temp{crafting_input:{0:[{Slot:0b,item_tag:["#minecraft:planks"]},{Slot:1b,id:"minecraft:barrel"},{Slot:2b,item_tag:["#minecraft:planks"]}],1:[{Slot:0b,id:"minecraft:stick"},{Slot:1b,id:"minecraft:iron_nugget"},{Slot:2b,id:"minecraft:stick"}],2:[{Slot:0b,item_tag:["#minecraft:planks"]},{Slot:1b,id:"minecraft:barrel"},{Slot:2b,item_tag:["#minecraft:planks"]}]}} run function simpledrawer:impl/crafts/double_new_drawer
execute store result score @s smithed.data if entity @s[scores={smithed.data=0}] if data storage smithed.crafter:main root.temp{crafting_input:{0:[{Slot:0b,item_tag:["#minecraft:planks"]},{Slot:1b,id:"minecraft:barrel"},{Slot:2b,item_tag:["#minecraft:planks"]}],1:[{Slot:0b,id:"minecraft:barrel"},{Slot:1b,id:"minecraft:iron_nugget"},{Slot:2b,id:"minecraft:barrel"}],2:[{Slot:0b,item_tag:["#minecraft:planks"]},{Slot:1b,id:"minecraft:barrel"},{Slot:2b,item_tag:["#minecraft:planks"]}]}} run function simpledrawer:impl/crafts/quadruple_new_drawer

execute 
    store result score @s smithed.data if entity @s[scores={smithed.data=0}] 
    if data storage smithed.crafter:main root.temp{crafting_input:{
        0:[{Slot:0b,id:"minecraft:smooth_stone"},{Slot:1b,id:"minecraft:crafting_table"},{Slot:2b,id:"minecraft:smooth_stone"}],
        1:[{Slot:0b,id:"minecraft:piston"},{Slot:1b,tag:{ctc:{from:"airdox_:simpledrawer",id:"new_drawer"}}},{Slot:2b,id:"minecraft:piston"}],
        2:[{Slot:0b,id:"minecraft:smooth_stone"},{Slot:1b,id:"minecraft:iron_ingot"},{Slot:2b,id:"minecraft:smooth_stone"}]}} 
        run loot replace block ~ ~ ~ container.16 loot simpledrawer:impl/items/compacting_new_drawer


# Christmas drawer
execute 
    if score #christmas_event simpledrawer.math matches 1
    store result score @s smithed.data if entity @s[scores={smithed.data=0}] 
    if data storage smithed.crafter:main root.temp{crafting_input:{
        0:[{Slot:0b,id:"minecraft:packed_ice"},{Slot:1b,id:"minecraft:stick"},{Slot:2b,id:"minecraft:packed_ice"}],
        1:[{Slot:0b,id:"minecraft:stick"},{Slot:1b,id:"minecraft:iron_nugget"},{Slot:2b,id:"minecraft:stick"}],
        2:[{Slot:0b,id:"minecraft:packed_ice"},{Slot:1b,id:"minecraft:barrel"},{Slot:2b,id:"minecraft:packed_ice"}]}} 
    
    run function simpledrawer:impl/crafts/new_drawer_ice

# Christmas drawer
execute 
    if score #christmas_event simpledrawer.math matches 1
    store result score @s smithed.data if entity @s[scores={smithed.data=0}] 
    if data storage smithed.crafter:main root.temp{crafting_input:{
        0:[{Slot:0b,id:"minecraft:packed_ice"},{Slot:1b,id:"minecraft:barrel"},{Slot:2b,id:"minecraft:packed_ice"}],
        1:[{Slot:0b,id:"minecraft:stick"},{Slot:1b,id:"minecraft:iron_nugget"},{Slot:2b,id:"minecraft:stick"}],
        2:[{Slot:0b,id:"minecraft:packed_ice"},{Slot:1b,id:"minecraft:barrel"},{Slot:2b,id:"minecraft:packed_ice"}]}} 
    
    run function simpledrawer:impl/crafts/double_new_drawer_ice

# Christmas drawer
execute 
    if score #christmas_event simpledrawer.math matches 1
    store result score @s smithed.data if entity @s[scores={smithed.data=0}] 
    if data storage smithed.crafter:main root.temp{crafting_input:{
        0:[{Slot:0b,id:"minecraft:packed_ice"},{Slot:1b,id:"minecraft:barrel"},{Slot:2b,id:"minecraft:packed_ice"}],
        1:[{Slot:0b,id:"minecraft:barrel"},{Slot:1b,id:"minecraft:iron_nugget"},{Slot:2b,id:"minecraft:barrel"}],
        2:[{Slot:0b,id:"minecraft:packed_ice"},{Slot:1b,id:"minecraft:barrel"},{Slot:2b,id:"minecraft:packed_ice"}]}} 
    
    run function simpledrawer:impl/crafts/quadruple_new_drawer_ice

