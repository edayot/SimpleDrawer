scoreboard players set #success_material simpledrawer.io 1

scoreboard players set #ingot_in_block simpledrawer.io 9
scoreboard players set #nugget_in_block simpledrawer.io 81
scoreboard players set #nugget_in_ingot simpledrawer.io 9


data modify storage simpledrawer:io material set value {material: "my_data_pack.my_material", material_name:'{"text":"My material"}'}


# Fill the NBT with your own items
data modify storage simpledrawer:io material.block set value {id: "minecraft:command_block", tag:{display:{Name:'{"text":"My block"}'},ctc:{id:"my_block",from:"my_data_pack"}}}
data modify storage simpledrawer:io material.ingot set value {id: "minecraft:command_block", tag:{display:{Name:'{"text":"My ingot"}'},ctc:{id:"my_ingot",from:"my_data_pack"}}}
data modify storage simpledrawer:io material.nugget set value {id: "minecraft:command_block", tag:{display:{Name:'{"text":"My nugget"}'},ctc:{id:"my_nugget",from:"my_data_pack"}}}






