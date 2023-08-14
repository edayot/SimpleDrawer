#In :
#- score #success_material simpledrawer.io
#- storage simpledrawer:io item_material

#Out :
#- storage simpledrawer:io material
#- score #success_material simpledrawer.io (0: fail, 1: success)
#- score #type simpledrawer.io (0: block, 1: ingot, 2: nugget)
#- score #ingot_in_block simpledrawer.io
#- score #nugget_in_block simpledrawer.io
#- score #nugget_in_ingot simpledrawer.io
#- score @s simpledrawer.new_drawer.slot_count (3: normal, 2: redstone block like)








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

        material_last=translate_key.split(".")[-1]

        if nugget is None:

            data modify storage simpledrawer:io material set value {
                material: translate_key,
                material_name: f'{{"translate":"{translate_key}","fallback":"{material_last}"}}',
                block: block.nbt,
                ingot: ingot.nbt,
            }
        else:
            scoreboard players set @s simpledrawer.new_drawer.slot_count 3

            data modify storage simpledrawer:io material set value {
                material: translate_key,
                material_name:f'{{"translate":"{translate_key}","fallback":"{material_last}"}}',
                
                block: block.nbt,
                ingot: ingot.nbt,
                nugget: nugget.nbt
            }


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

generate_material(
    "simpledrawer.minecraft.copper",
    block={
        test: {id:"minecraft:copper_block"},
        nbt: {id:"minecraft:copper_block",Count:1,Slot:0}
    },
    ingot={
        test: {id:"minecraft:copper_ingot"},
        nbt: {id:"minecraft:copper_ingot",Count:1,Slot:1}
    }
)

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
generate_material(
    "simpledrawer.minecraft.emerald",
    block={
        test: {id:"minecraft:emerald_block"},
        nbt: {id:"minecraft:emerald_block",Count:1,Slot:0}
    },
    ingot={
        test: {id:"minecraft:emerald"},
        nbt: {id:"minecraft:emerald",Count:1,Slot:1}
    },
)
generate_material(
    "simpledrawer.minecraft.lapis",
    block={
        test: {id:"minecraft:lapis_block"},
        nbt: {id:"minecraft:lapis_block",Count:1,Slot:0}
    },
    ingot={
        test: {id:"minecraft:lapis_lazuli"},
        nbt: {id:"minecraft:lapis_lazuli",Count:1,Slot:1}
    },
)
generate_material(
    "simpledrawer.minecraft.coal",
    block={
        test: {id:"minecraft:coal_block"},
        nbt: {id:"minecraft:coal_block",Count:1,Slot:0}
    },
    ingot={
        test: {id:"minecraft:coal"},
        nbt: {id:"minecraft:coal",Count:1,Slot:1}
    },
)

generate_material(
    "simpledrawer.minecraft.netherite",
    block={
        test: {id:"minecraft:netherite_block"},
        nbt: {id:"minecraft:netherite_block",Count:1,Slot:0}
    },
    ingot={
        test: {id:"minecraft:netherite_ingot"},
        nbt: {id:"minecraft:netherite_ingot",Count:1,Slot:1}
    },
)

generate_material(
    "simpledrawer.minecraft.raw_iron",
    block={
        test: {id:"minecraft:raw_iron_block"},
        nbt: {id:"minecraft:raw_iron_block",Count:1,Slot:0}
    },
    ingot={
        test: {id:"minecraft:raw_iron"},
        nbt: {id:"minecraft:raw_iron",Count:1,Slot:1}
    }
)
generate_material(
    "simpledrawer.minecraft.raw_gold",
    block={
        test: {id:"minecraft:raw_gold_block"},
        nbt: {id:"minecraft:raw_gold_block",Count:1,Slot:0}
    },
    ingot={
        test: {id:"minecraft:raw_gold"},
        nbt: {id:"minecraft:raw_gold",Count:1,Slot:1}
    }
)
generate_material(
    "simpledrawer.minecraft.raw_copper",
    block={
        test: {id:"minecraft:raw_copper_block"},
        nbt: {id:"minecraft:raw_copper_block",Count:1,Slot:0}
    },
    ingot={
        test: {id:"minecraft:raw_copper"},
        nbt: {id:"minecraft:raw_copper",Count:1,Slot:1}
    }
)


generate_material(
    "simpledrawer.minecraft.slime",
    block={
        test: {id:"minecraft:slime_block"},
        nbt: {id:"minecraft:slime_block",Count:1,Slot:0}
    },
    ingot={
        test: {id:"minecraft:slime_ball"},
        nbt: {id:"minecraft:slime_ball",Count:1,Slot:1}
    },
)

generate_material(
    "simpledrawer.minecraft.wheat",
    block={
        test: {id:"minecraft:hay_block"},
        nbt: {id:"minecraft:hay_block",Count:1,Slot:0}
    },
    ingot={
        test: {id:"minecraft:wheat"},
        nbt: {id:"minecraft:wheat",Count:1,Slot:1}
    },
)

generate_material(
    "simpledrawer.minecraft.bone",
    block={
        test: {id:"minecraft:bone_block"},
        nbt: {id:"minecraft:bone_block",Count:1,Slot:0}
    },
    ingot={
        test: {id:"minecraft:bone_meal"},
        nbt: {id:"minecraft:bone_meal",Count:1,Slot:1}
    },
)

generate_material(
    "simpledrawer.minecraft.clay",
    block={
        test: {id:"minecraft:clay"},
        nbt: {id:"minecraft:clay",Count:1,Slot:0}
    },
    ingot={
        test: {id:"minecraft:clay_ball"},
        nbt: {id:"minecraft:clay_ball",Count:1,Slot:1}
    },
)







