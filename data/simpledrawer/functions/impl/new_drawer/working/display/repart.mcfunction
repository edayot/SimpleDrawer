
data modify storage simpledrawer:main temp.variant set from entity @s Item.tag.simpledrawer.variant

execute if data storage simpledrawer:main temp{variant:"classic"} at @s align xyz run function simpledrawer:impl/new_drawer/working/repart/classic
execute if data storage simpledrawer:main temp{variant:"double"} at @s align xyz run function simpledrawer:impl/new_drawer/working/repart/double

