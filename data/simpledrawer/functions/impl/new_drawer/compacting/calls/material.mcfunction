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
# - score @s simpledrawer:new_drawer slot_count (3: normal, 2: redstone block like)
def generate_material(
    translate_key,
    block,
    ingot,
    nugget=None,
    ingot_in_block=9,
    nugget_in_block=81,
    nugget_in_ingot=9,
):
    name=f'{__name__}/{translate_key}/block'
    execute 
        unless score #success_material simpledrawer.io matches 1
        if data storage simpledrawer:io f'{{item_material:{block.test}}}'
        run function name:
            scoreboard players set #type simpledrawer.io 0
            function f"{__name__}/{translate_key}"

    name=f'{__name__}/{translate_key}/ingot'
    execute
        unless score #success_material simpledrawer.io matches 1
        if data storage simpledrawer:io f'{{item_material:{ingot.test}}}'
        run function name:
            scoreboard players set #type simpledrawer.io 1
            function f"{__name__}/{translate_key}"
    
    if nugget is not None:
        name=f'{__name__}/{translate_key}/nugget'
        execute
            unless score #success_material simpledrawer.io matches 1
            if data storage simpledrawer:io f'{{item_material:{nugget.test}}}'
            run function name:
                scoreboard players set #type simpledrawer.io 2
                function f"{__name__}/{translate_key}"
    
    name=f"{__name__}/{translate_key}"
    function name:
        scoreboard players set #success_material simpledrawer.io 1
        scoreboard players set #ingot_in_block simpledrawer.io f"{ingot_in_block}"
        scoreboard players set #nugget_in_block simpledrawer.io f"{nugget_in_block}"

        scoreboard players set #nugget_in_ingot simpledrawer.io f"{nugget_in_ingot}"


        if nugget is None:
            scoreboard players set @s simpledrawer.new_drawer.slot_count 2

            data modify storage simpledrawer:io material set value {
                material: '{{"translate":"simpledrawer.minecraft.{translate_key}"}}',
                block: block.nbt,
                ingot: ingot.nbt,
                nugget: {id:"minecraft:air",Count:1,Slot:2}
            }
        else:
            scoreboard players set @s simpledrawer.new_drawer.slot_count 3

            data modify storage simpledrawer:io material set value {
                material: '{{"translate":"simpledrawer.minecraft.{translate_key}"}}',
                block: block.nbt,
                ingot: ingot.nbt,
                nugget: nugget.nbt
            }


# gold
generate_material(
    "simpledrawer.minecraft.gold",
    block={
        test: {id:"minecraft:gold_block"},
        nbt: {id:"minecraft:gold_block",Count:1,Slot:0}
        
    },
    ingot={
        test: {id:"minecraft:gold_ingot"},
        nbt: {id:"minecraft:gold_ingot",Count:1,Slot:1}
    },
    nugget={
        test: {id:"minecraft:gold_nugget"},
        nbt: {id:"minecraft:gold_nugget",Count:1,Slot:2}
    }
) 
# redstone
generate_material(
    "simpledrawer.minecraft.redstone",
    block={
        test: {id:"minecraft:redstone_block"},
        nbt: {id:"minecraft:redstone_block",Count:1,Slot:0}
        
    },
    ingot={
        test: {id:"minecraft:redstone"},
        nbt: {id:"minecraft:redstone",Count:1,Slot:1}
    },
)
# iron
generate_material(
    "simpledrawer.minecraft.iron",
    block={
        test: {id:"minecraft:iron_block"},
        nbt: {id:"minecraft:iron_block",Count:1,Slot:0}
        
    },
    ingot={
        test: {id:"minecraft:iron_ingot"},
        nbt: {id:"minecraft:iron_ingot",Count:1,Slot:1}
    },
    nugget={
        test: {id:"minecraft:iron_nugget"},
        nbt: {id:"minecraft:iron_nugget",Count:1,Slot:2}
    }
)
# diamond
generate_material(
    "simpledrawer.minecraft.diamond",
    block={
        test: {id:"minecraft:diamond_block"},
        nbt: {id:"minecraft:diamond_block",Count:1,Slot:0}
        
    },
    ingot={
        test: {id:"minecraft:diamond"},
        nbt: {id:"minecraft:diamond",Count:1,Slot:1}
    },
)