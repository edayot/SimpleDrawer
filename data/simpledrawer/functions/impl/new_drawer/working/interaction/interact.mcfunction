# @public
#say INTERACT
advancement revoke @s only simpledrawer:interact
playsound minecraft:entity.item_frame.add_item block @s ~ ~ ~


execute store result score #gametime simpledrawer.math run time query gametime
execute store success score #ifsneak simpledrawer.math if predicate simpledrawer:sneaking

tag @s add simpledrawer.interacter
execute if data entity @s SelectedItem as @e[tag=simpledrawer.new_drawer.part.interaction,distance=..7] run function simpledrawer:impl/new_drawer/working/interaction/interact/search
tag @s remove simpledrawer.interacter



