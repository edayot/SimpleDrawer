

data modify storage simpledrawer:main temp.ItemCraft set from storage simpledrawer:main ItemsNBT.double_new_drawer


execute if data storage smithed.crafter:main root.temp{crafting_input:{0:[{Slot:0b,id:"minecraft:acacia_planks"}]}} run function simpledrawer:impl/crafts/double_new_drawer/acacia
execute if data storage smithed.crafter:main root.temp{crafting_input:{0:[{Slot:0b,id:"minecraft:bamboo_planks"}]}} run function simpledrawer:impl/crafts/double_new_drawer/bamboo
execute if data storage smithed.crafter:main root.temp{crafting_input:{0:[{Slot:0b,id:"minecraft:birch_planks"}]}} run function simpledrawer:impl/crafts/double_new_drawer/birch
execute if data storage smithed.crafter:main root.temp{crafting_input:{0:[{Slot:0b,id:"minecraft:cherry_planks"}]}} run function simpledrawer:impl/crafts/double_new_drawer/cherry
execute if data storage smithed.crafter:main root.temp{crafting_input:{0:[{Slot:0b,id:"minecraft:crimson_planks"}]}} run function simpledrawer:impl/crafts/double_new_drawer/crimson
execute if data storage smithed.crafter:main root.temp{crafting_input:{0:[{Slot:0b,id:"minecraft:dark_oak_planks"}]}} run function simpledrawer:impl/crafts/double_new_drawer/dark_oak
execute if data storage smithed.crafter:main root.temp{crafting_input:{0:[{Slot:0b,id:"minecraft:jungle_planks"}]}} run function simpledrawer:impl/crafts/double_new_drawer/jungle
execute if data storage smithed.crafter:main root.temp{crafting_input:{0:[{Slot:0b,id:"minecraft:mangrove_planks"}]}} run function simpledrawer:impl/crafts/double_new_drawer/mangrove
execute if data storage smithed.crafter:main root.temp{crafting_input:{0:[{Slot:0b,id:"minecraft:spruce_planks"}]}} run function simpledrawer:impl/crafts/double_new_drawer/spruce
execute if data storage smithed.crafter:main root.temp{crafting_input:{0:[{Slot:0b,id:"minecraft:warped_planks"}]}} run function simpledrawer:impl/crafts/double_new_drawer/warped


loot replace block ~ ~ ~ container.16 loot simpledrawer:impl/items/new_drawer_craft


