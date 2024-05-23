

from ../material import generate_material



generate_material(
    "simpledrawer.minecraft.clay",
    block={
        test: {id:"minecraft:clay"},
        nbt: {id:"minecraft:clay",count:1,Slot:0}
    },
    ingot={
        test: {id:"minecraft:clay_ball"},
        nbt: {id:"minecraft:clay_ball",count:1,Slot:1}
    },
    ingot_in_block=4,
    nugget_in_ingot=4,
)

generate_material(
    "simpledrawer.minecraft.quartz",
    block={
        test: {id:"minecraft:quartz_block"},
        nbt: {id:"minecraft:quartz_block",count:1,Slot:0}
    },
    ingot={
        test: {id:"minecraft:quartz"},
        nbt: {id:"minecraft:quartz",count:1,Slot:1}
    },
    nugget=None,
    ingot_in_block=4,
    nugget_in_ingot=4,
)

generate_material(
    "simpledrawer.minecraft.sand",
    block={
        test: {id:"minecraft:sandstone"},
        nbt: {id:"minecraft:sandstone",count:1,Slot:0}
    },
    ingot={
        test: {id:"minecraft:sand"},
        nbt: {id:"minecraft:sand",count:1,Slot:1}
    },
    nugget=None,
    ingot_in_block=4,
    nugget_in_ingot=4,
)

generate_material(
    "simpledrawer.minecraft.red_sand",
    block={
        test: {id:"minecraft:red_sandstone"},
        nbt: {id:"minecraft:red_sandstone",count:1,Slot:0}
    },
    ingot={
        test: {id:"minecraft:red_sand"},
        nbt: {id:"minecraft:red_sand",count:1,Slot:1}
    },
    nugget=None,
    ingot_in_block=4,
    nugget_in_ingot=4,
)
