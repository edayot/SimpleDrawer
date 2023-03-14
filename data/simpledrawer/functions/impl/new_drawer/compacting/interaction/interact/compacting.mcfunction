scoreboard players set #if_try_compacting simpledrawer.math 1
execute store result score #gametime simpledrawer.math run time query gametime
execute store success score #ifsneak simpledrawer.math if predicate simpledrawer:sneaking




tag @s add simpledrawer.interacter
execute as @e[tag=simpledrawer.new_drawer.part.interaction_compacting,distance=..7] run function simpledrawer:impl/new_drawer/compacting/interaction/modified_interact/search
tag @s remove simpledrawer.interacter


