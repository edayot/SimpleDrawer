# @public
from simpledrawer import WOOD_TYPES

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

        for material in WOOD_TYPES:
            execute 
                if data storage smithed.crafter:input recipe{0:[{Slot:0b,id:f"minecraft:{material}_planks"}]} 
                data modify block ~ ~ ~ Items[{Slot:16b}].components."minecraft:container"[0].item.components."minecraft:custom_data".simpledrawer.wood_type set value f"simpledrawer:{material}"

        execute 
            if data storage smithed.crafter:input recipe{0:[{Slot:0b,id:"minecraft:packed_ice"}]} 
            data modify block ~ ~ ~ Items[{Slot:16b}].components."minecraft:container"[0].item.components."minecraft:custom_data".simpledrawer.wood_type set value f"simpledrawer:ice"


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

        for material in WOOD_TYPES:
            execute 
                if data storage smithed.crafter:input recipe{0:[{Slot:0b,id:f"minecraft:{material}_planks"}]} 
                data modify block ~ ~ ~ Items[{Slot:16b}].components."minecraft:container"[0].item.components."minecraft:custom_data".simpledrawer.wood_type set value f"simpledrawer:{material}"

        execute 
            if data storage smithed.crafter:input recipe{0:[{Slot:0b,id:"minecraft:packed_ice"}]} 
            data modify block ~ ~ ~ Items[{Slot:16b}].components."minecraft:container"[0].item.components."minecraft:custom_data".simpledrawer.wood_type set value f"simpledrawer:ice"


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

        for material in WOOD_TYPES:
            execute 
                if data storage smithed.crafter:input recipe{0:[{Slot:0b,id:f"minecraft:{material}_planks"}]} 
                data modify block ~ ~ ~ Items[{Slot:16b}].components."minecraft:container"[0].item.components."minecraft:custom_data".simpledrawer.wood_type set value f"simpledrawer:{material}"

        execute 
            if data storage smithed.crafter:input recipe{0:[{Slot:0b,id:"minecraft:packed_ice"}]} 
            data modify block ~ ~ ~ Items[{Slot:16b}].components."minecraft:container"[0].item.components."minecraft:custom_data".simpledrawer.wood_type set value f"simpledrawer:ice"



execute 
    store success score @s smithed.data 
    if entity @s[scores={smithed.data=0}]
    if data storage smithed.crafter:input recipe{
        0:[{Slot:0b,id:"minecraft:smooth_stone"},{Slot:1b,id:"minecraft:crafting_table"},{Slot:2b,id:"minecraft:smooth_stone"}],
        1:[{Slot:0b,id:"minecraft:piston"},{Slot:1b,components:{"minecraft:custom_data":{smithed:{id:"airdox_:simpledrawer/new_drawer"}}}},{Slot:2b,id:"minecraft:piston"}],
        2:[{Slot:0b,id:"minecraft:smooth_stone"},{Slot:1b,id:"minecraft:iron_ingot"},{Slot:2b,id:"minecraft:smooth_stone"}]
    }
    run loot replace block ~ ~ ~ container.16 loot simpledrawer:impl/items/compacting_new_drawer



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



