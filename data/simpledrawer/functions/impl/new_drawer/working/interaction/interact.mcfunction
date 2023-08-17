# @public
#say INTERACT
advancement revoke @s only simpledrawer:impl/interact
playsound minecraft:entity.item_frame.add_item block @s ~ ~ ~


execute store result score #gametime simpledrawer.math run time query gametime
execute store success score #ifsneak simpledrawer.math if predicate simpledrawer:impl/sneaking

data remove storage simpledrawer:main temp.SelectedItem
data modify storage simpledrawer:main temp.SelectedItem set from entity @s SelectedItem

tag @s add simpledrawer.interacter
scoreboard players set #found simpledrawer.math 0
execute 
    as @e[tag=simpledrawer.new_drawer.part.interaction,distance=..7,sort=nearest] 
    run function simpledrawer:impl/new_drawer/working/interaction/interact/search_test:
        execute 
            if score #found simpledrawer.math matches 0
            run function simpledrawer:impl/new_drawer/working/interaction/interact/search
tag @s remove simpledrawer.interacter



