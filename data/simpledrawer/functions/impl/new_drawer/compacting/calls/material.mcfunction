# @public


# In :
# - score #success_material simpledrawer.io
# - storage simpledrawer:io mitem_material

# Out :
# - storage simpledrawer:io material
# - score #success_material simpledrawer.io (0: fail, 1: success)
# - score #type simpledrawer.io (0: block, 1: ingot, 2: nugget)
# - score #ingot_in_block simpledrawer.io
# - score #nugget_in_block simpledrawer.io
# - score #nugget_in_ingot simpledrawer.io
execute 
    unless score #success_material simpledrawer.io matches 1
    if data storage simpledrawer:io {item_material:{id:"minecraft:iron_block"}}
    run function ./material/iron/iron_block:
        scoreboard players set #type simpledrawer.io 0
        function ./material/iron

execute
    unless score #success_material simpledrawer.io matches 1
    if data storage simpledrawer:io {item_material:{id:"minecraft:iron_ingot"}}
    run function ./material/iron/iron_ingot:
        scoreboard players set #type simpledrawer.io 1
        function ./material/iron

execute
    unless score #success_material simpledrawer.io matches 1
    if data storage simpledrawer:io {item_material:{id:"minecraft:iron_nugget"}}
    run function ./material/iron/iron_nugget:
        scoreboard players set #type simpledrawer.io 2
        function ./material/iron

function ./material/iron:
    scoreboard players set #success_material simpledrawer.io 1
    scoreboard players set #ingot_in_block simpledrawer.io 9
    scoreboard players set #nugget_in_block simpledrawer.io 81

    scoreboard players set #nugget_in_ingot simpledrawer.io 9

    scoreboard players set #hide_nugget simpledrawer.io 0
    # 0: show, 1: hide, used for redstone block

    data modify storage simpledrawer:io material set value {
        material: "simpledrawer.minecraft.iron",
        block: {id:"minecraft:iron_block",Count:1b,Slot:0},
        ingot: {id:"minecraft:iron_ingot",Count:1b,Slot:1},
        nugget: {id:"minecraft:iron_nugget",Count:1b,Slot:2}
    }

execute 
    unless score #success_material simpledrawer.io matches 1
    if data storage simpledrawer:io {item_material:{id:"minecraft:redstone_block"}}
    run function ./material/redstone/redstone_block:
        scoreboard players set #type simpledrawer.io 0
        function ./material/redstone

execute
    unless score #success_material simpledrawer.io matches 1
    if data storage simpledrawer:io {item_material:{id:"minecraft:redstone"}}
    run function ./material/redstone/redstone:
        scoreboard players set #type simpledrawer.io 1
        function ./material/redstone



function ./material/redstone:
    scoreboard players set #success_material simpledrawer.io 1
    scoreboard players set #ingot_in_block simpledrawer.io 9
    scoreboard players set #nugget_in_block simpledrawer.io 9

    scoreboard players set #nugget_in_ingot simpledrawer.io 1

    scoreboard players set #hide_nugget simpledrawer.io 1
    # 0: show, 1: hide, used for redstone block

    data modify storage simpledrawer:io material set value {
        material: "simpledrawer.minecraft.redstone",
        block: {id:"minecraft:redstone_block",Count:1b,Slot:0},
        ingot: {id:"minecraft:redstone",Count:1b,Slot:1},
        nugget: {id:"minecraft:redstone",Count:1b,Slot:2}
    }