tag @s add global.ignore
tag @s add simpledrawer.new_drawer.part
tag @s add simpledrawer.new_drawer.part.base_block

tag @s add smithed.entity
tag @s add smithed.strict

scoreboard players operation @s simpledrawer.new_drawer.id = #global simpledrawer.new_drawer.id

tp @s ~ ~ ~ ~ ~

data modify entity @s item set value {
    id:"minecraft:furnace",
    count:1,
    components:{
        "minecraft:item_model":"simpledrawer:new_drawer",
        "minecraft:container":[
            {
                slot:0,
                item:{
                    id:"minecraft:stone",
                    count:1,
                    components:{
                        "minecraft:custom_data":{
                            simpledrawer:{
                                wood_type:"simpledrawer:oak",
                                variant:"single",
                                slot_count:1b,
                                items_counts:{
                                    0:0, 1:0, 2:0, 3:0, 4:0, 5:0,
                                    6:0, 7:0, 8:0, 9:0, 10:0, 11:0,
                                    12:0, 13:0, 14:0, 15:0, 16:0, 17:0,
                                    18:0, 19:0, 20:0, 21:0, 22:0, 23:0,
                                    24:0, 25:0, 26:0
                                }
                            }
                        }
                    }
                }
            }
        ]
    }
}

data modify entity @s item.components."minecraft:container"[0].item.components."minecraft:custom_data".simpledrawer.wood_type set from storage simpledrawer:main temp.simpledrawer.wood_type
data modify entity @s item.components."minecraft:container"[0].item.components."minecraft:custom_data".simpledrawer.variant set from storage simpledrawer:main temp.simpledrawer.variant
data modify entity @s item.components."minecraft:container"[0].item.components."minecraft:custom_data".simpledrawer.slot_count set from storage simpledrawer:main temp.simpledrawer.slot_count


data merge entity @s {transformation:{scale:[1.001f,1.001f,1.001f],translation:[0.0f,0.0f,-1.0f]}}


