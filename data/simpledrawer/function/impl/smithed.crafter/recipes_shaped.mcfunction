# @public
execute unless score simpledrawer load.status matches 1 run return fail

execute 
    if entity @s[scores={smithed.data=0}]
    if data storage smithed.crafter:input recipe{
        0:[{Slot:0b,item_tag:["#minecraft:planks"]},{Slot:1b,id:"minecraft:stick"},{Slot:2b,item_tag:["#minecraft:planks"]}],
        1:[{Slot:0b,id:"minecraft:stick"},{Slot:1b,id:"minecraft:iron_nugget"},{Slot:2b,id:"minecraft:stick"}],
        2:[{Slot:0b,item_tag:["#minecraft:planks"]},{Slot:1b,id:"minecraft:barrel"},{Slot:2b,item_tag:["#minecraft:planks"]}]
    }
    run function ~/new_drawer:
        scoreboard players set @s smithed.data 1
        loot replace block ~ ~ ~ container.16 loot simpledrawer:impl/items/new_drawer

        for material in ["acacia","bamboo","birch","cherry","crimson","dark_oak","jungle","mangrove","spruce","warped","oak"]:
            command = 'execute if data storage smithed.crafter:input recipe{0:[{Slot:0b,id:"minecraft:'+material+'_planks"}]} run item modify block ~ ~ ~ container.16 simpledrawer:impl/material/'+material
            raw f"{command}"
        execute if data storage smithed.crafter:input recipe{0:[{Slot:0b,id:"minecraft:packed_ice"}]} run item modify block ~ ~ ~ container.16 simpledrawer:impl/material/ice


execute 
    if entity @s[scores={smithed.data=0}]
    if data storage smithed.crafter:input recipe{
        0:[{Slot:0b,item_tag:["#minecraft:planks"]},{Slot:1b,id:"minecraft:barrel"},{Slot:2b,item_tag:["#minecraft:planks"]}],
        1:[{Slot:0b,id:"minecraft:stick"},{Slot:1b,id:"minecraft:iron_nugget"},{Slot:2b,id:"minecraft:stick"}],
        2:[{Slot:0b,item_tag:["#minecraft:planks"]},{Slot:1b,id:"minecraft:barrel"},{Slot:2b,item_tag:["#minecraft:planks"]}]
    }
    run function ~/double_new_drawer:
        scoreboard players set @s smithed.data 1
        loot replace block ~ ~ ~ container.16 loot simpledrawer:impl/items/double_new_drawer

        for material in ["acacia","bamboo","birch","cherry","crimson","dark_oak","jungle","mangrove","spruce","warped","oak"]:
            command = 'execute if data storage smithed.crafter:input recipe{0:[{Slot:0b,id:"minecraft:'+material+'_planks"}]} run item modify block ~ ~ ~ container.16 simpledrawer:impl/material/'+material
            raw f"{command}"
        execute if data storage smithed.crafter:input recipe{0:[{Slot:0b,id:"minecraft:packed_ice"}]} run item modify block ~ ~ ~ container.16 simpledrawer:impl/material/ice


execute 
    if entity @s[scores={smithed.data=0}]
    if data storage smithed.crafter:input recipe{
        0:[{Slot:0b,item_tag:["#minecraft:planks"]},{Slot:1b,id:"minecraft:barrel"},{Slot:2b,item_tag:["#minecraft:planks"]}],
        1:[{Slot:0b,id:"minecraft:barrel"},{Slot:1b,id:"minecraft:iron_nugget"},{Slot:2b,id:"minecraft:barrel"}],
        2:[{Slot:0b,item_tag:["#minecraft:planks"]},{Slot:1b,id:"minecraft:barrel"},{Slot:2b,item_tag:["#minecraft:planks"]}]
    }
    run function ~/quadruple_new_drawer:
        scoreboard players set @s smithed.data 1
        loot replace block ~ ~ ~ container.16 loot simpledrawer:impl/items/quadruple_new_drawer

        for material in ["acacia","bamboo","birch","cherry","crimson","dark_oak","jungle","mangrove","spruce","warped","oak"]:
            command = 'execute if data storage smithed.crafter:input recipe{0:[{Slot:0b,id:"minecraft:'+material+'_planks"}]} run item modify block ~ ~ ~ container.16 simpledrawer:impl/material/'+material
            raw f"{command}"
        execute if data storage smithed.crafter:input recipe{0:[{Slot:0b,id:"minecraft:packed_ice"}]} run item modify block ~ ~ ~ container.16 simpledrawer:impl/material/ice



execute 
    store success score @s smithed.data 
    if entity @s[scores={smithed.data=0}]
    if data storage smithed.crafter:input recipe{
        0:[{Slot:0b,id:"minecraft:smooth_stone"},{Slot:1b,id:"minecraft:crafting_table"},{Slot:2b,id:"minecraft:smooth_stone"}],
        1:[{Slot:0b,id:"minecraft:piston"},{Slot:1b,components:{"minecraft:custom_data":{smithed:{id:"airdox_:simpledrawer/new_drawer"}}}},{Slot:2b,id:"minecraft:piston"}],
        2:[{Slot:0b,id:"minecraft:smooth_stone"},{Slot:1b,id:"minecraft:iron_ingot"},{Slot:2b,id:"minecraft:smooth_stone"}]
    }
    run loot replace block ~ ~ ~ container.16 loot simpledrawer:impl/items/compacting_new_drawer



execute
    store success score @s smithed.data 
    if entity @s[scores={smithed.data=0}]
    if data storage smithed.crafter:input recipe{
        0:[{Slot:0b,id:"minecraft:stick"},{Slot:1b,id:"minecraft:stick"},{Slot:2b,id:"minecraft:stick"}],
        1:[{Slot:0b,id:"minecraft:iron_ingot"},{Slot:1b,id:"minecraft:oak_planks"},{Slot:2b,id:"minecraft:iron_ingot"}],
        2:[{Slot:0b,id:"minecraft:iron_ingot"},{Slot:1b,id:"minecraft:oak_planks"},{Slot:2b,id:"minecraft:iron_ingot"}]
    }
    run loot replace block ~ ~ ~ container.16 loot simpledrawer:impl/items/iron_upgrade

execute
    store success score @s smithed.data 
    if entity @s[scores={smithed.data=0}]
    if data storage smithed.crafter:input recipe{
        0:[{Slot:0b,id:"minecraft:stick"},{Slot:1b,id:"minecraft:stick"},{Slot:2b,id:"minecraft:stick"}],
        1:[{Slot:0b,id:"minecraft:gold_ingot"},{Slot:1b,components:{"minecraft:custom_data":{smithed:{id:"airdox_:simpledrawer/iron_upgrade"}}}},{Slot:2b,id:"minecraft:gold_ingot"}],
        2:[{Slot:0b,id:"minecraft:gold_ingot"},{Slot:1b,id:"minecraft:air"},{Slot:2b,id:"minecraft:gold_ingot"}]
    }
    run loot replace block ~ ~ ~ container.16 loot simpledrawer:impl/items/gold_upgrade

execute
    store success score @s smithed.data 
    if entity @s[scores={smithed.data=0}]
    if data storage smithed.crafter:input recipe{
        0:[{Slot:0b,id:"minecraft:stick"},{Slot:1b,id:"minecraft:stick"},{Slot:2b,id:"minecraft:stick"}],
        1:[{Slot:0b,id:"minecraft:diamond"},{Slot:1b,components:{"minecraft:custom_data":{smithed:{id:"airdox_:simpledrawer/gold_upgrade"}}}},{Slot:2b,id:"minecraft:diamond"}],
        2:[{Slot:0b,id:"minecraft:diamond"},{Slot:1b,id:"minecraft:air"},{Slot:2b,id:"minecraft:diamond"}]
    }
    run loot replace block ~ ~ ~ container.16 loot simpledrawer:impl/items/diamond_upgrade

execute
    store success score @s smithed.data 
    if entity @s[scores={smithed.data=0}]
    if data storage smithed.crafter:input recipe{
        0:[{Slot:0b,id:"minecraft:stick"},{Slot:1b,id:"minecraft:diamond"},{Slot:2b,id:"minecraft:stick"}],
        1:[{Slot:0b,id:"minecraft:iron_ingot"},{Slot:1b,components:{"minecraft:custom_data":{smithed:{id:"airdox_:simpledrawer/diamond_upgrade"}}}},{Slot:2b,id:"minecraft:iron_ingot"}],
        2:[{Slot:0b,id:"minecraft:iron_ingot"},{Slot:1b,id:"minecraft:nether_star"},{Slot:2b,id:"minecraft:iron_ingot"}]
    }
    run loot replace block ~ ~ ~ container.16 loot simpledrawer:impl/items/star_upgrade

execute
    store success score @s smithed.data 
    if entity @s[scores={smithed.data=0}]
    if data storage smithed.crafter:input recipe{
        0:[{Slot:0b,id:"minecraft:nether_star"},{Slot:1b,id:"minecraft:nether_star"},{Slot:2b,id:"minecraft:nether_star"}],
        1:[{Slot:0b,id:"minecraft:netherite_ingot"},{Slot:1b,components:{"minecraft:custom_data":{smithed:{id:"airdox_:simpledrawer/star_upgrade"}}}},{Slot:2b,id:"minecraft:netherite_ingot"}],
        2:[{Slot:0b,id:"minecraft:netherite_ingot"},{Slot:1b,id:"minecraft:netherite_ingot"},{Slot:2b,id:"minecraft:netherite_ingot"}]
    }
    run loot replace block ~ ~ ~ container.16 loot simpledrawer:impl/items/netherite_upgrade

execute
    store success score @s smithed.data 
    if entity @s[scores={smithed.data=0}]
    if data storage smithed.crafter:input recipe{
        0:[{Slot:0b,id:"minecraft:air"},{Slot:1b,id:"minecraft:iron_nugget"},{Slot:2b,components:{"minecraft:custom_data":{smithed:{id:"airdox_:simpledrawer/iron_upgrade"}}}}],
        1:[{Slot:0b,id:"minecraft:air"},{Slot:1b,id:"minecraft:iron_ingot"},{Slot:2b,id:"minecraft:iron_nugget"}],
        2:[{Slot:0b,id:"minecraft:iron_ingot"},{Slot:1b,id:"minecraft:air"},{Slot:2b,id:"minecraft:air"}]
    }
    run loot replace block ~ ~ ~ container.16 loot simpledrawer:impl/items/downgrade_wrench


execute
    store success score @s smithed.data 
    if entity @s[scores={smithed.data=0}]
    if data storage smithed.crafter:input recipe{
        0:[{Slot:0b,id:"minecraft:barrel"},{Slot:1b,id:"minecraft:iron_nugget"},{Slot:2b,id:"minecraft:air"}],
        1:[{Slot:0b,id:"minecraft:book"},{Slot:1b,id:"minecraft:oak_planks"},{Slot:2b,id:"minecraft:air"}],
    }
    if data storage smithed.crafter:input {recipe:{2:[]}}
    run loot replace block ~ ~ ~ container.16 loot simpledrawer:impl/items/guide
    








# New Drawer Ice
execute
    if biome ~ ~ ~ #simpledrawer:snowy
    if entity @s[scores={smithed.data=0}]
    if data storage smithed.crafter:input recipe{
        0:[{Slot:0b,id:"minecraft:packed_ice"},{Slot:1b,id:"minecraft:stick"},{Slot:2b,id:"minecraft:packed_ice"}],
        1:[{Slot:0b,id:"minecraft:stick"},{Slot:1b,id:"minecraft:iron_nugget"},{Slot:2b,id:"minecraft:stick"}],
        2:[{Slot:0b,id:"minecraft:packed_ice"},{Slot:1b,id:"minecraft:barrel"},{Slot:2b,id:"minecraft:packed_ice"}]
    }
    run function ~/new_drawer

# Double New Drawer Ice
execute
    if biome ~ ~ ~ #simpledrawer:snowy
    if entity @s[scores={smithed.data=0}]
    if data storage smithed.crafter:input recipe{
        0:[{Slot:0b,id:"minecraft:packed_ice"},{Slot:1b,id:"minecraft:barrel"},{Slot:2b,id:"minecraft:packed_ice"}],
        1:[{Slot:0b,id:"minecraft:stick"},{Slot:1b,id:"minecraft:iron_nugget"},{Slot:2b,id:"minecraft:stick"}],
        2:[{Slot:0b,id:"minecraft:packed_ice"},{Slot:1b,id:"minecraft:barrel"},{Slot:2b,id:"minecraft:packed_ice"}]
    }
    run function ~/double_new_drawer

# Quadruple New Drawer Ice
execute
    if biome ~ ~ ~ #simpledrawer:snowy
    if entity @s[scores={smithed.data=0}]
    if data storage smithed.crafter:input recipe{
        0:[{Slot:0b,id:"minecraft:packed_ice"},{Slot:1b,id:"minecraft:barrel"},{Slot:2b,id:"minecraft:packed_ice"}],
        1:[{Slot:0b,id:"minecraft:barrel"},{Slot:1b,id:"minecraft:iron_nugget"},{Slot:2b,id:"minecraft:barrel"}],
        2:[{Slot:0b,id:"minecraft:packed_ice"},{Slot:1b,id:"minecraft:barrel"},{Slot:2b,id:"minecraft:packed_ice"}]
    }
    run function ~/quadruple_new_drawer



