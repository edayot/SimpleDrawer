scoreboard players set #success_material simpledrawer.io 1

scoreboard players set #ingot_in_block simpledrawer.io 9
scoreboard players set #nugget_in_ingot simpledrawer.io 9


data modify storage simpledrawer:io material set value {material: "my_data_pack.my_material", material_name:{"text":"My material"}}


# Fill the NBT with your own items
data modify storage simpledrawer:io material.block set value {item:{id: "minecraft:command_block", components:{"minecraft:custom_name":{"text":"My block"},"minecraft:custom_data":{ctc:{id:"my_block",from:"my_data_pack"}}}}}
data modify storage simpledrawer:io material.ingot set value {item:{id: "minecraft:command_block", components:{"minecraft:custom_name":{"text":"My ingot"},"minecraft:custom_data":{ctc:{id:"my_ingot",from:"my_data_pack"}}}}}
data modify storage simpledrawer:io material.nugget set value {item:{id: "minecraft:command_block", components:{"minecraft:custom_name":{"text":"My nugget"},"minecraft:custom_data":{ctc:{id:"my_nugget",from:"my_data_pack"}}}}}






