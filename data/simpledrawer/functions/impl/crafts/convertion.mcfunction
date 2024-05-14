

data modify storage simpledrawer:main temp.ItemCraft set from storage simpledrawer:main ItemsNBT.new_drawer

#execute if data storage smithed.crafter:main root.temp{shapeless_crafting_input:[{Count:1b,tag:{ctc:{from:"airdox_:simpledrawer",id:"drawer"}}}]}

data modify storage simpledrawer:main temp.ItemCraft.tag.BlockEntityTag.Items[0].components."minecraft:custom_data".simpledrawer.upgrade set from storage smithed.crafter:main root.temp.shapeless_crafting_input[0].tag.BlockEntityTag.Items[0].components."minecraft:custom_data".simpledrawer.type
data modify storage simpledrawer:main temp.ItemCraft.tag.BlockEntityTag.Items[0].components."minecraft:custom_data".simpledrawer.hopper set from storage smithed.crafter:main root.temp.shapeless_crafting_input[0].tag.BlockEntityTag.Items[0].components."minecraft:custom_data".simpledrawer.hopper

execute if data storage smithed.crafter:main root.temp.shapeless_crafting_input[0].tag.BlockEntityTag.Items[0].components."minecraft:custom_data".simpledrawer{type:"iron"} run data modify storage simpledrawer:main temp.ItemCraft.tag.BlockEntityTag.Items[0].components."minecraft:custom_data".simpledrawer.maxCount set from storage simpledrawer:main drawer_type.iron.maxCount
execute if data storage smithed.crafter:main root.temp.shapeless_crafting_input[0].tag.BlockEntityTag.Items[0].components."minecraft:custom_data".simpledrawer{type:"gold"} run data modify storage simpledrawer:main temp.ItemCraft.tag.BlockEntityTag.Items[0].components."minecraft:custom_data".simpledrawer.maxCount set from storage simpledrawer:main drawer_type.gold.maxCount
execute if data storage smithed.crafter:main root.temp.shapeless_crafting_input[0].tag.BlockEntityTag.Items[0].components."minecraft:custom_data".simpledrawer{type:"diamond"} run data modify storage simpledrawer:main temp.ItemCraft.tag.BlockEntityTag.Items[0].components."minecraft:custom_data".simpledrawer.maxCount set from storage simpledrawer:main drawer_type.diamond.maxCount
execute if data storage smithed.crafter:main root.temp.shapeless_crafting_input[0].tag.BlockEntityTag.Items[0].components."minecraft:custom_data".simpledrawer{type:"star"} run data modify storage simpledrawer:main temp.ItemCraft.tag.BlockEntityTag.Items[0].components."minecraft:custom_data".simpledrawer.maxCount set from storage simpledrawer:main drawer_type.star.maxCount
execute if data storage smithed.crafter:main root.temp.shapeless_crafting_input[0].tag.BlockEntityTag.Items[0].components."minecraft:custom_data".simpledrawer{type:"netherite"} run data modify storage simpledrawer:main temp.ItemCraft.tag.BlockEntityTag.Items[0].components."minecraft:custom_data".simpledrawer.maxCount set from storage simpledrawer:main drawer_type.netherite.maxCount



execute if data storage smithed.crafter:main root.temp.shapeless_crafting_input[0].tag.BlockEntityTag.Items[0].components."minecraft:custom_data".simpledrawer.Item run function simpledrawer:impl/crafts/convertion_filled



data modify storage simpledrawer:main temp.dropped_item set from storage simpledrawer:main temp.ItemCraft
data modify storage simpledrawer:main temp.simpledrawer set from storage simpledrawer:main temp.dropped_item.tag.BlockEntityTag.Items[0].components."minecraft:custom_data".simpledrawer

function simpledrawer:impl/new_drawer/destroy_variant




data modify storage simpledrawer:main temp.ItemCraft set from storage simpledrawer:main temp.dropped_item

loot replace block ~ ~ ~ container.16 loot simpledrawer:impl/items/new_drawer_craft


return 1
