





def place_drawer(wood_type, variant, drawer_type, upgrade, hopper):
    scoreboard players add #global simpledrawer.new_drawer.id 1
    data modify storage simpledrawer:main temp.simpledrawer set from storage simpledrawer:main ItemsNBT.new_drawer.tag.BlockEntityTag.Items[0].tag.simpledrawer

    data modify storage simpledrawer:main temp.simpledrawer.wood_type set value f"{wood_type}"
    data modify storage simpledrawer:main temp.simpledrawer.type set value f"{drawer_type}"
    data modify storage simpledrawer:main temp.simpledrawer.variant set value f"{variant}"
    data modify storage simpledrawer:main temp.simpledrawer.upgrade set value f"{upgrade}"
    raw f"data modify storage simpledrawer:main temp.simpledrawer.maxCount set from storage simpledrawer:main drawer_type.{upgrade}.maxCount"
    raw f"data modify storage simpledrawer:main temp.simpledrawer.hopper set value {hopper}b"

    if drawer_type == "compacting":
        data modify storage simpledrawer:main temp.simpledrawer.current_material set value "none"
        data modify storage simpledrawer:main temp.simpledrawer.current_material_name set value '{"text":"none"}'
        data modify storage simpledrawer:main temp.simpledrawer.slot_count set value 1


    execute rotated 180 0 align xyz positioned ~.5 ~.5 ~.5 summon item_display run function simpledrawer:impl/new_drawer/place/base



wood_types = [
    "acacia",
    "bamboo",
    "birch",
    "cherry",
    "crimson",
    "dark_oak",
    "jungle",
    "mangrove",
    "spruce",
    "warped",
    "oak",
    "ice"
]
wood_types.sort()

drawer_variants = [
    "single",
    "double",
    "quadruple",
]

upgrades = [
    "wood",
    "iron",
    "gold",
    "diamond",
    "star",
    "netherite",
]



for i,wood_type in enumerate(wood_types):
    for j,drawer_variant in enumerate(drawer_variants):
        for hopper in [0,1]:
            for k,upgrade in enumerate(upgrades):
                i_offset = 2*i
                j_offset = 2*j + len(drawer_variants)*2*hopper
                k_offset = 2*k
                name = f"simpledrawer:impl/generate_all_drawer/{wood_type}_{drawer_variant}_{upgrade}_{hopper}"
                function name:
                    place_drawer("simpledrawer:"+wood_type, drawer_variant, "normal", upgrade, hopper)
                
                execute positioned ~i_offset ~k_offset ~j_offset run function name

i+=1
j = 0



for hopper in [0,1]:
    for k,upgrade in enumerate(upgrades):
        i_offset = 2*i
        j_offset = 2*j + len(drawer_variants)*2*hopper
        k_offset = 2*k
        name = f"simpledrawer:impl/generate_all_drawer/compacting_{upgrade}_{hopper}"
        function name:
            place_drawer("simpledrawer:acacia", "normal", "compacting", upgrade, hopper)
        
        execute positioned ~i_offset ~k_offset ~j_offset run function name
