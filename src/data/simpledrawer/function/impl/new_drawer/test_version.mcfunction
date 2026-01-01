# @to_update
# update the new_drawer version, simply a copy or maybe a some breaking changes or to handle the new features

# nothing from 1.9.0 to 1.9.1
# nothing from 1.9.1 to 1.9.2


# 1.9.X to 1.10.0 => add simpledrawer.new_drawer.wood_base
# all drawers were wood base in that time
execute
    if score @s simpledrawer.block.major matches 1
    if score @s simpledrawer.block.minor matches 9
    if score @s simpledrawer.block.patch matches 0..2
    run function ./1.9_to_1.10:
        tag @s[tag=!simpledrawer.new_drawer.stone_base] add simpledrawer.new_drawer.wood_base
        scoreboard players set @s simpledrawer.block.major 1
        scoreboard players set @s simpledrawer.block.minor 10
        scoreboard players set @s simpledrawer.block.patch 0


# 1.10.X to 1.11.0 => add score simpledrawer.new_drawer.as_players_entities
# all drawers have players entities in that time
execute
    if score @s simpledrawer.block.major matches 1
    if score @s simpledrawer.block.minor matches 10
    if score @s simpledrawer.block.patch matches 0..
    run function ./1.10_to_1.11:
        scoreboard players set @s simpledrawer.new_drawer.as_players_entities 1
        scoreboard players set @s simpledrawer.block.major 1
        scoreboard players set @s simpledrawer.block.minor 11
        scoreboard players set @s simpledrawer.block.patch 0


execute
    if score @s simpledrawer.block.major matches ..1
    run return fail


execute
    if score @s simpledrawer.block.major matches 2
    if score @s simpledrawer.block.minor matches ..1
    run function ./2.0_2.1_to_2.2:
        scoreboard players set @s simpledrawer.block.major 2
        scoreboard players set @s simpledrawer.block.minor 2
        scoreboard players set @s simpledrawer.block.patch 0
        function simpledrawer:impl/new_drawer/base_display

execute
    if score @s simpledrawer.block.major matches 2
    if score @s simpledrawer.block.minor matches ..5
    run function ./2_to_2.6.0:
        scoreboard players set @s simpledrawer.block.major 2
        scoreboard players set @s simpledrawer.block.minor 6
        scoreboard players set @s simpledrawer.block.patch 1
        scoreboard players operation #search_id simpledrawer.math = @s simpledrawer.new_drawer.id
        data modify storage simpledrawer:main temp.simpledrawer set from entity @s item.components."minecraft:custom_data".simpledrawer
        execute 
            at @s 
            as @e[tag=simpledrawer.new_drawer.part.base_block,limit=1,predicate=simpledrawer:impl/search_id_new_drawer,distance=..10]
            run function ./2_to_2.6.0/base_block:
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



# from 2.6.0 to 2.8.0 => material change in compacting drawers
execute
    if score @s simpledrawer.block.major matches 2
    if score @s simpledrawer.block.minor matches 6..7
    if score @s simpledrawer.block.patch matches 0..
    run function ./2.6_to_2.7:
        scoreboard players set @s simpledrawer.block.major 2
        scoreboard players set @s simpledrawer.block.minor 8
        scoreboard players set @s simpledrawer.block.patch 0

        execute 
            if items entity @s container.0 *[
                minecraft:custom_data~{simpledrawer:{current_material:"simpledrawer.minecraft.copper"}}
            ] run function ./upgrade:
                execute 
                    store result score #temp simpledrawer.math 
                    run data get entity @s item.components."minecraft:custom_data".simpledrawer.items_counts.1
                scoreboard players operation #temp simpledrawer.math *= #9 simpledrawer.math
                execute
                    store result entity @s item.components."minecraft:custom_data".simpledrawer.items_counts.2 int 1
                    run scoreboard players get #temp simpledrawer.math
                data modify entity @s item.components."minecraft:container" append value {item:{id:"minecraft:copper_nugget",count:1}, slot:2}
                scoreboard players set @s simpledrawer.new_drawer.slot_count 3

                scoreboard players operation #search_id simpledrawer.math = @s simpledrawer.new_drawer.id
                scoreboard players set #search_slot simpledrawer.math 2
                data modify entity @e[tag=simpledrawer.new_drawer.part.item_display,limit=1,predicate=simpledrawer:impl/search_id_slot_new_drawer,distance=..10] item set value {id:"minecraft:copper_nugget",count:1}

                function simpledrawer:impl/new_drawer/base_display


        



#copy the new version
scoreboard players operation @s simpledrawer.block.major = #simpledrawer.major load.status
scoreboard players operation @s simpledrawer.block.minor = #simpledrawer.minor load.status
scoreboard players operation @s simpledrawer.block.patch = #simpledrawer.patch load.status
