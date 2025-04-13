scoreboard players add #global simpledrawer.new_drawer.id 1



data remove storage simpledrawer:main temp
data modify storage simpledrawer:main temp.simpledrawer set from storage smithed.custom_block:main blockApi.__data.Items[0].components."minecraft:custom_data".simpledrawer
data modify storage simpledrawer:main temp.simpledrawer_container set from storage smithed.custom_block:main blockApi.__data.Items[0].components."minecraft:container"

execute summon item_display run function simpledrawer:impl/new_drawer/place/base


