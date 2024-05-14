
execute 
    if entity @s[tag=simpledrawer.new_drawer.wood_base] 
    store success score #if_item_exists simpledrawer.math 
    run tag @e[type=item,nbt={Item:{id:"minecraft:beehive",Count:1b},Age:0s},limit=1,sort=nearest,distance=..1] add simpledrawer.dropped_item

execute 
    if entity @s[tag=simpledrawer.new_drawer.stone_base] 
    store success score #if_item_exists simpledrawer.math 
    run tag @e[type=item,nbt={Item:{id:"minecraft:lodestone",Count:1b},Age:0s},limit=1,sort=nearest,distance=..1] add simpledrawer.dropped_item


execute 
    unless score #if_item_exists simpledrawer.math matches 1
    run summon item ~ ~ ~ {Tags:["simpledrawer.dropped_item"],Item:{id:"minecraft:stone",Count:1b}}


data modify storage simpledrawer:main temp.dropped_item set from storage simpledrawer:main ItemsNBT.new_drawer

data modify storage simpledrawer:main temp.dropped_item.tag.BlockEntityTag.Items[0].components."minecraft:custom_data".simpledrawer set from entity @s item.components."minecraft:custom_data".simpledrawer

data modify storage simpledrawer:main temp.simpledrawer set from storage simpledrawer:main temp.dropped_item.tag.BlockEntityTag.Items[0].components."minecraft:custom_data".simpledrawer

function simpledrawer:impl/new_drawer/destroy_variant


execute as @e[type=item,tag=simpledrawer.dropped_item,limit=1,sort=nearest] run function simpledrawer:impl/new_drawer/destroy_item


scoreboard players operation #search_id simpledrawer.math = @s simpledrawer.new_drawer.id
kill @e[tag=simpledrawer.new_drawer.part,predicate=simpledrawer:impl/search_id_new_drawer]
