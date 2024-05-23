
execute 
    if entity @s[tag=simpledrawer.new_drawer.wood_base] 
    run kill @e[type=item,nbt={Item:{id:"minecraft:beehive",count:1},Age:0s},limit=1,sort=nearest,distance=..1]

execute 
    if entity @s[tag=simpledrawer.new_drawer.stone_base] 
    run kill @e[type=item,nbt={Item:{id:"minecraft:lodestone",count:1},Age:0s},limit=1,sort=nearest,distance=..1]










scoreboard players operation #search_id simpledrawer.math = @s simpledrawer.new_drawer.id
kill @e[tag=simpledrawer.new_drawer.part,predicate=simpledrawer:impl/search_id_new_drawer]
