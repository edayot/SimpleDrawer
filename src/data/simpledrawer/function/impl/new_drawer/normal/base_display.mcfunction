

scoreboard players operation #search_id simpledrawer.math = @s simpledrawer.new_drawer.id


data modify storage simpledrawer:main temp.simpledrawer_display_normal set from entity @s item.components."minecraft:custom_data".simpledrawer
data remove storage simpledrawer:main temp.simpledrawer_display_normal.items_counts



execute 
    at @s
    as @e[tag=simpledrawer.new_drawer.part.base_block,limit=1,predicate=simpledrawer:impl/search_id_new_drawer,distance=..10]
    run function ~/base_block:
        data modify storage simpledrawer:main temp.simpledrawer_display_normal.items_counts set value {
            0:0, 1:0, 2:0, 3:0, 4:0, 5:0,
            6:0, 7:0, 8:0, 9:0, 10:0, 11:0,
            12:0, 13:0, 14:0, 15:0, 16:0, 17:0,
            18:0, 19:0, 20:0, 21:0, 22:0, 23:0,
            24:0, 25:0, 26:0
        }
        data modify entity @s item.components."minecraft:container"[0].item.components."minecraft:custom_data".simpledrawer set from storage simpledrawer:main temp.simpledrawer_display_normal


