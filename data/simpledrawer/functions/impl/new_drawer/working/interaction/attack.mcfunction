# @public

advancement revoke @s only simpledrawer:impl/attack
playsound minecraft:entity.item_frame.add_item block @s ~ ~ ~

#say ATTACK
execute store result score #gametime simpledrawer.math run time query gametime
execute store success score #ifsneak simpledrawer.math if predicate simpledrawer:impl/sneaking

data remove storage simpledrawer:main temp.SelectedItem
data modify storage simpledrawer:main temp.SelectedItem set from entity @s SelectedItem

tag @s add simpledrawer.attacker
execute as @e[tag=simpledrawer.new_drawer.part.interaction,distance=..7] run function simpledrawer:impl/new_drawer/working/interaction/attack/search
tag @s remove simpledrawer.attacker


