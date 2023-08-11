scoreboard players add #global simpledrawer.new_drawer.id 1



data remove storage simpledrawer:main temp
data modify storage simpledrawer:main temp.simpledrawer set from storage simpledrawer:main ItemsNBT.new_drawer.tag.BlockEntityTag.Items[0].tag.simpledrawer
data modify storage simpledrawer:main temp.simpledrawer set from storage smithed.custom_block:main blockApi.__data.Items[0].tag.simpledrawer

execute summon item_display run function simpledrawer:impl/new_drawer/place/base


