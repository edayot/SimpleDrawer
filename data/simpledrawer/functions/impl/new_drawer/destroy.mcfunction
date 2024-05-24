
execute 
    if entity @s[tag=simpledrawer.new_drawer.wood_base] 
    run kill @e[type=item,nbt={Item:{id:"minecraft:beehive",count:1},Age:0s},limit=1,sort=nearest,distance=..1]

execute 
    if entity @s[tag=simpledrawer.new_drawer.stone_base] 
    run kill @e[type=item,nbt={Item:{id:"minecraft:lodestone",count:1},Age:0s},limit=1,sort=nearest,distance=..1]




data remove storage simpledrawer:main temp.simpledrawer
data modify storage simpledrawer:main temp.simpledrawer set from entity @s item.components."minecraft:custom_data".simpledrawer

data modify storage simpledrawer:main temp.summoned set value 1b


function ~/loot_spawn with storage simpledrawer:main temp.simpledrawer

function ~/loot_spawn:
    $loot spawn ~ ~ ~ loot { \
        "pools": [ \
            { \
                "rolls": 1, \
                "entries": [ \
                    { \
                        "type": "minecraft:loot_table", \
                        "value": "$(loot_table)", \
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
        } \

        scoreboard players set #nb_items simpledrawer.math 0
        execute store result score #nb_items simpledrawer.math if data storage simpledrawer:main temp.simpledrawer.Items[]
        execute if score #nb_items simpledrawer.math matches 1.. run function ./destroy/filled
        execute if score #nb_items simpledrawer.math matches 0 run function ./destroy/empty






scoreboard players operation #search_id simpledrawer.math = @s simpledrawer.new_drawer.id
kill @e[tag=simpledrawer.new_drawer.part,predicate=simpledrawer:impl/search_id_new_drawer]
