
schedule function simpledrawer:impl/tick 1t replace
execute unless score simpledrawer load.status matches 1 run return fail

execute 
    as @e[
        type=item_display,
        tag=simpledrawer.new_drawer.base,
        tag=simpledrawer.new_drawer.wood_base,
        predicate=!simpledrawer:impl/destroyer_beehive,
        predicate=simpledrawer:impl/test_version
    ] 
    at @s 
    run function simpledrawer:impl/new_drawer/destroy
execute 
    as @e[
        type=item_display,
        tag=simpledrawer.new_drawer.base,
        tag=simpledrawer.new_drawer.stone_base,
        predicate=!simpledrawer:impl/destroyer_lodestone,
        predicate=simpledrawer:impl/test_version
    ] 
    at @s 
    run function simpledrawer:impl/new_drawer/destroy

kill @e[
    type=item,
    nbt={
        Item:{
            id:"minecraft:lodestone",
            count:1,
            components:{
                "minecraft:custom_data":{
                    simpledrawer:{tape:1b}
                }
            },
        },
    },
]




scoreboard players set #count_summon simpledrawer.math 0
execute 
    as @e[
        type=item_display,
        tag=simpledrawer.new_drawer.part.base
    ] 
    at @s 
    run function simpledrawer:impl/new_drawer/tick



