# @public


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



execute 
    store success score @s smithed.data 
    if entity @s[scores={smithed.data=0}]
    if data storage smithed.crafter:input recipe{
        0:[{Slot:0b,id:"minecraft:smooth_stone"},{Slot:1b,id:"minecraft:barrel"},{Slot:2b,id:"minecraft:smooth_stone"}],
        1:[{Slot:0b,id:"minecraft:piston"},{Slot:1b,components:{"minecraft:custom_data":{smithed:{id:"simpledrawer:new_drawer"}}}},{Slot:2b,id:"minecraft:piston"}],
        2:[{Slot:0b,id:"minecraft:smooth_stone"},{Slot:1b,id:"minecraft:iron_ingot"},{Slot:2b,id:"minecraft:smooth_stone"}]
    }
    run loot replace block ~ ~ ~ container.16 loot simpledrawer:impl/items/compacting_new_drawer










