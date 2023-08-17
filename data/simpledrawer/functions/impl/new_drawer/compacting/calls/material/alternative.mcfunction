

from ../material import generate_material



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
    ingot_in_block=4,
    nugget_in_block=16,
    nugget_in_ingot=4,
)

generate_material(
    "simpledrawer.minecraft.quartz",
    block={
        test: {id:"minecraft:quartz_block"},
        nbt: {id:"minecraft:quartz_block",Count:1,Slot:0}
    },
    ingot={
        test: {id:"minecraft:quartz"},
        nbt: {id:"minecraft:quartz",Count:1,Slot:1}
    },
    nugget=None,
    ingot_in_block=4,
    nugget_in_block=16,
    nugget_in_ingot=4,
)

generate_material(
    "simpledrawer.minecraft.sand",
    block={
        test: {id:"minecraft:sandstone"},
        nbt: {id:"minecraft:sandstone",Count:1,Slot:0}
    },
    ingot={
        test: {id:"minecraft:sand"},
        nbt: {id:"minecraft:sand",Count:1,Slot:1}
    },
    nugget=None,
    ingot_in_block=4,
    nugget_in_block=16,
    nugget_in_ingot=4,
)

generate_material(
    "simpledrawer.minecraft.red_sand",
    block={
        test: {id:"minecraft:red_sandstone"},
        nbt: {id:"minecraft:red_sandstone",Count:1,Slot:0}
    },
    ingot={
        test: {id:"minecraft:red_sand"},
        nbt: {id:"minecraft:red_sand",Count:1,Slot:1}
    },
    nugget=None,
    ingot_in_block=4,
    nugget_in_block=16,
    nugget_in_ingot=4,
)
