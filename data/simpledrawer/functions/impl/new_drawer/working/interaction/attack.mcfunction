# @public

advancement revoke @s only simpledrawer:impl/attack
execute unless score simpledrawer load.status matches 1 run return fail
playsound minecraft:entity.item_frame.add_item block @s ~ ~ ~

#say ATTACK
execute store result score #gametime simpledrawer.math run time query gametime
execute store success score #ifsneak simpledrawer.math if predicate simpledrawer:impl/sneaking

data remove storage simpledrawer:main temp.SelectedItem
data modify storage simpledrawer:main temp.SelectedItem set from entity @s SelectedItem

tag @s add simpledrawer.attacker
scoreboard players set #found simpledrawer.math 0
execute 
    as @e[tag=simpledrawer.new_drawer.part.interaction,distance=..10,sort=nearest] 
    run function simpledrawer:impl/new_drawer/working/interaction/attack/search_test:
        execute 
            if score #found simpledrawer.math matches 0
            run function simpledrawer:impl/new_drawer/working/interaction/attack/search
        data remove entity @s interaction
        data remove entity @s attack
execute 
    unless score #found simpledrawer.math matches 0
    run scoreboard players add @s simpledrawer.nb_click 1
tag @s remove simpledrawer.attacker



