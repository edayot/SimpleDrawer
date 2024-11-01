
execute 
    if entity @s[tag=simpledrawer.new_drawer.wood_base] 
    run kill @e[type=item,nbt={Item:{id:"minecraft:beehive",count:1},Age:0s},limit=1,sort=nearest,distance=..1]

execute 
    if entity @s[tag=simpledrawer.new_drawer.stone_base] 
    run kill @e[type=item,nbt={Item:{id:"minecraft:lodestone",count:1},Age:0s},limit=1,sort=nearest,distance=..1]




data remove storage simpledrawer:main temp.simpledrawer
data modify storage simpledrawer:main temp.simpledrawer set from entity @s item.components."minecraft:custom_data".simpledrawer

data remove storage simpledrawer:main temp.simpledrawer_container
data modify storage simpledrawer:main temp.simpledrawer_container set from entity @s item.components."minecraft:container"

data modify storage simpledrawer:main temp.summoned set value 1b

scoreboard players set #temp_slot_count simpledrawer.math 0
scoreboard players operation #temp_slot_count simpledrawer.math = @s simpledrawer.new_drawer.slot_count


data modify storage simpledrawer:main temp.item_models set value {normal:"simpledrawer:new_drawer/oak_1", tapped:"simpledrawer:new_drawer/oak_1_tapped"}
execute 
    if data storage simpledrawer:main temp.simpledrawer{type:"normal",variant:"single"}
    run function ~/get_model/single:
        for wood_type in ["acacia","bamboo","birch","cherry","crimson","dark_oak","jungle","mangrove","spruce","warped","oak", "ice"]:
            execute 
                if data storage simpledrawer:main temp.simpledrawer{wood_type:f"simpledrawer:{wood_type}"} 
                run data modify storage simpledrawer:main temp.item_models set value {
                    normal:f"simpledrawer:new_drawer/{wood_type}_1", 
                    tapped:f"simpledrawer:new_drawer/{wood_type}_1_tapped"
                }
            
execute
    if data storage simpledrawer:main temp.simpledrawer{type:"normal",variant:"double"}
    run function ~/get_model/double:
        for wood_type in ["acacia","bamboo","birch","cherry","crimson","dark_oak","jungle","mangrove","spruce","warped","oak", "ice"]:
            execute 
                if data storage simpledrawer:main temp.simpledrawer{wood_type:f"simpledrawer:{wood_type}"} 
                run data modify storage simpledrawer:main temp.item_models set value {
                    normal:f"simpledrawer:new_drawer/{wood_type}_2", 
                    tapped:f"simpledrawer:new_drawer/{wood_type}_2_tapped"
                }

execute
    if data storage simpledrawer:main temp.simpledrawer{type:"normal",variant:"quadruple"}
    run function ~/get_model/quadruple:
        for wood_type in ["acacia","bamboo","birch","cherry","crimson","dark_oak","jungle","mangrove","spruce","warped","oak", "ice"]:
            execute 
                if data storage simpledrawer:main temp.simpledrawer{wood_type:f"simpledrawer:{wood_type}"} 
                run data modify storage simpledrawer:main temp.item_models set value {
                    normal:f"simpledrawer:new_drawer/{wood_type}_4", 
                    tapped:f"simpledrawer:new_drawer/{wood_type}_4_tapped"
                }

execute 
    if data storage simpledrawer:main temp.simpledrawerXX{type:"compacting",variant:"normal"}
    run function ~/get_model/compacting:
        execute
            if score @s simpledrawer.new_drawer.slot_count matches 1
            run data modify storage simpledrawer:main temp.item_models set value {
                normal:"simpledrawer:new_drawer/comp_1", 
                tapped:"simpledrawer:new_drawer/comp_1_tapped"
            }
        execute
            if score @s simpledrawer.new_drawer.slot_count matches 2
            run data modify storage simpledrawer:main temp.item_models set value {
                normal:"simpledrawer:new_drawer/comp_2", 
                tapped:"simpledrawer:new_drawer/comp_2_tapped"
            }
        execute
            if score @s simpledrawer.new_drawer.slot_count matches 3
            run data modify storage simpledrawer:main temp.item_models set value {
                normal:"simpledrawer:new_drawer/comp_3", 
                tapped:"simpledrawer:new_drawer/comp_3_tapped"
            }

function ~/loot_spawn with storage simpledrawer:main temp.simpledrawer

function ~/loot_spawn:
    $loot spawn ~ ~ ~ loot { \
        "pools": [ \
            { \
                "rolls": 1, \
                "entries": [ \
                    { \
                        "type": "minecraft:loot_table", \
                        "value": "simpledrawer:impl/$(loot_table)", \
                        "functions": [ \
                            { \
                                "function": "minecraft:copy_custom_data", \
                                "source": { \
                                    "type": "minecraft:storage", \
                                    "source": "simpledrawer:main" \
                                }, \
                                "ops": [ \
                                    { \
                                        "source": "temp.summoned", \
                                        "target": "simpledrawer_summoned", \
                                        "op": "replace" \
                                    } \
                                ] \
                            } \
                        ] \
                    } \
                ] \
            } \
        ] \
    }

execute 
    as @e[type=item,sort=nearest]
    if items entity @s container.0 minecraft:furnace[minecraft:custom_data~{simpledrawer_summoned:1b}] 
    run function ~/item:
        data remove entity @s Item.components."minecraft:custom_data".simpledrawer_summoned

        item modify entity @s container.0 { \
            "function": "minecraft:modify_contents", \
            "component": "minecraft:container", \
            "modifier": { \
                "function": "minecraft:copy_custom_data", \
                "source": { \
                    "type": "minecraft:storage", \
                    "source": "simpledrawer:main" \
                }, \
                "ops": [ \
                    { \
                        "source": "temp.simpledrawer", \
                        "target": "simpledrawer", \
                        "op": "replace" \
                    } \
                ] \
            } \
        }
        data modify entity @s Item.components."minecraft:container"[0].item.components."minecraft:container" set from storage simpledrawer:main temp.simpledrawer_container

        data modify entity @s Item.components."minecraft:item_model" set from storage simpledrawer:main temp.item_models.normal


        scoreboard players set #nb_items simpledrawer.math 0
        execute store result score #nb_items simpledrawer.math if data storage simpledrawer:main temp.simpledrawer_container[]
        execute if score #nb_items simpledrawer.math matches 1.. run function ./destroy/filled
        execute if score #nb_items simpledrawer.math matches 0 run function ./destroy/empty

        function simpledrawer:impl/new_drawer/destroy/variant






scoreboard players operation #search_id simpledrawer.math = @s simpledrawer.new_drawer.id
kill @e[tag=simpledrawer.new_drawer.part,predicate=simpledrawer:impl/search_id_new_drawer]
