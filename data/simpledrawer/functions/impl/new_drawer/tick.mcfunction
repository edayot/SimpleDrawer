
scoreboard players set #good_version simpledrawer.math 0
execute if entity @s[predicate=simpledrawer:impl/test_version] run scoreboard players set #good_version simpledrawer.math 1

execute 
    if score #good_version simpledrawer.math matches 0
    run function simpledrawer:impl/new_drawer/test_version


execute
    if score #good_version simpledrawer.math matches 1
    run function ./check_player_nearby:
        scoreboard players set #player_nearby simpledrawer.math 0
        execute if entity @a[distance=..16] run scoreboard players set #player_nearby simpledrawer.math 1
        scoreboard players add @s simpledrawer.new_drawer.no_format_cooldown 0
        scoreboard players remove @s[scores={simpledrawer.new_drawer.no_format_cooldown=1..}] simpledrawer.new_drawer.no_format_cooldown 1

        execute 
            if score #player_nearby simpledrawer.math matches 0
            if score @s simpledrawer.new_drawer.as_players_entities matches 1 
            run function ./kill_player_entities:
                scoreboard players operation #search_id simpledrawer.math = @s simpledrawer.new_drawer.id
                kill @e[
                    tag=!simpledrawer.new_drawer.base,
                    tag=!simpledrawer.new_drawer.part.base_block,
                    tag=simpledrawer.new_drawer.part,
                    predicate=simpledrawer:impl/search_id_new_drawer
                ]
                data modify entity @e[tag=simpledrawer.new_drawer.part.base_block,limit=1,sort=nearest, predicate=simpledrawer:impl/search_id_new_drawer] transformation.scale set value [1.01f,1.01f,1.01f]
                scoreboard players set @s simpledrawer.new_drawer.as_players_entities 0


        execute
            if score #player_nearby simpledrawer.math matches 1
            if score @s simpledrawer.new_drawer.as_players_entities matches 0
            if score #count_summon simpledrawer.math < #config.max_resummon simpledrawer.math
            run function ./resummon_player_entities:
                scoreboard players add #count_summon simpledrawer.math 1
                data remove storage simpledrawer:main temp
                data modify storage simpledrawer:main temp.simpledrawer set from entity @s item.components."minecraft:custom_data".simpledrawer
                data modify storage simpledrawer:main temp.simpledrawer_container set from entity @s item.components."minecraft:container"
                scoreboard players operation #place_id simpledrawer.math = @s simpledrawer.new_drawer.id

                execute 
                    if data storage simpledrawer:main temp.simpledrawer{wood_type:"simpledrawer:compacting"} 
                    store result storage simpledrawer:main temp.simpledrawer.slot_count int 1 
                    run scoreboard players get @s simpledrawer.new_drawer.slot_count

                function simpledrawer:impl/new_drawer/place/variant
                scoreboard players set @s simpledrawer.new_drawer.as_players_entities 1
                function simpledrawer:impl/new_drawer/base_display_rup
                
                scoreboard players operation #search_id simpledrawer.math = @s simpledrawer.new_drawer.id
                data modify entity @e[tag=simpledrawer.new_drawer.part.base_block,limit=1,sort=nearest, predicate=simpledrawer:impl/search_id_new_drawer] transformation.scale set value [1.001f,1.001f,1.001f]



        execute 
            if score #player_nearby simpledrawer.math matches 1 
            if score @s simpledrawer.new_drawer.as_players_entities matches 1 
            if score @s simpledrawer.new_drawer.no_format_cooldown matches 0
            if entity @s[tag=simpledrawer.new_drawer.to_update] run function simpledrawer:impl/new_drawer/base_display_rup

        execute if entity @s[predicate=!simpledrawer:impl/test_version] run function simpledrawer:impl/new_drawer/test_version