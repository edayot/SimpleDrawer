

data modify storage simpledrawer:main temp.ItemCraft set from storage simpledrawer:main ItemsNBT.new_drawer

#execute if data storage smithed.crafter:main root.temp{shapeless_crafting_input:[{Count:1b,tag:{ctc:{from:"airdox_:simpledrawer",id:"drawer"}}}]}

data modify storage simpledrawer:main temp.ItemCraft.tag.BlockEntityTag.Items[0].tag.simpledrawer.upgrade set from storage smithed.crafter:main root.temp.shapeless_crafting_input[0].tag.BlockEntityTag.Items[0].tag.simpledrawer.type
data modify storage simpledrawer:main temp.ItemCraft.tag.BlockEntityTag.Items[0].tag.simpledrawer.hopper set from storage smithed.crafter:main root.temp.shapeless_crafting_input[0].tag.BlockEntityTag.Items[0].tag.simpledrawer.hopper

execute if data storage smithed.crafter:main root.temp.shapeless_crafting_input[0].tag.BlockEntityTag.Items[0].tag.simpledrawer.Item run function simpledrawer:impl/crafts/convertion_filled

data modify storage simpledrawer:main temp.ItemCraft.tag.display.Lore prepend value '{"text":"This drawer as been converted","color":"gray"}'

loot replace block ~ ~ ~ container.16 loot simpledrawer:impl/items/new_drawer_craft


