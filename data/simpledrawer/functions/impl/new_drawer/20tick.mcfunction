
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
            if score #count_summon simpledrawer.math < #max_resummon simpledrawer.math
            run function ./resummon_player_entities:
                scoreboard players add #count_summon simpledrawer.math 1
                data remove storage simpledrawer:main temp
                data modify storage simpledrawer:main temp.simpledrawer set from storage simpledrawer:main ItemsNBT.new_drawer.tag.BlockEntityTag.Items[0].tag.simpledrawer
                data modify storage simpledrawer:main temp.simpledrawer set from entity @s item.tag.simpledrawer
                scoreboard players operation #place_id simpledrawer.math = @s simpledrawer.new_drawer.id
                function simpledrawer:impl/new_drawer/place/variant
                scoreboard players set @s simpledrawer.new_drawer.as_players_entities 1
                function simpledrawer:impl/new_drawer/base_display_rup
                
                scoreboard players operation #search_id simpledrawer.math = @s simpledrawer.new_drawer.id
                data modify entity @e[tag=simpledrawer.new_drawer.part.base_block,limit=1,sort=nearest, predicate=simpledrawer:impl/search_id_new_drawer] transformation.scale set value [1.001f,1.001f,1.001f]



        execute 
            if score #player_nearby simpledrawer.math matches 1 
            if score @s simpledrawer.new_drawer.as_players_entities matches 1 
            if entity @s[tag=simpledrawer.new_drawer.to_update] run function simpledrawer:impl/new_drawer/base_display_rup

        execute if entity @s[predicate=!simpledrawer:impl/test_version] run function simpledrawer:impl/new_drawer/test_version