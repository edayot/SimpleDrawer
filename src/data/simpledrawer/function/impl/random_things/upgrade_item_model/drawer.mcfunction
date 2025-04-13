from simpledrawer import DRAWER_TYPES

say DRAWER

data modify storage simpledrawer:main temp.simpledrawer set from storage simpledrawer:main temp.InventoryUpgrade[0].components."minecraft:container"[0].item.components."minecraft:custom_data".simpledrawer

data modify storage simpledrawer:main temp.item_models set value {normal:"simpledrawer:new_drawer/oak_1", tapped:"simpledrawer:new_drawer/oak_1_tapped"}
execute 
    if data storage simpledrawer:main temp.simpledrawer{type:"normal",variant:"single"}
    run function ~/get_model/single:
        for wood_type in DRAWER_TYPES:
            execute 
                if data storage simpledrawer:main temp.simpledrawer{wood_type:f"simpledrawer:{wood_type}"} 
                run data modify storage simpledrawer:main temp.item_models set value {
                    normal:f"simpledrawer:new_drawer/{wood_type}_1", 
                    tapped:f"simpledrawer:new_drawer/{wood_type}_1_tapped"
                }
            
execute
    if data storage simpledrawer:main temp.simpledrawer{type:"normal",variant:"double"}
    run function ~/get_model/double:
        for wood_type in DRAWER_TYPES:
            execute 
                if data storage simpledrawer:main temp.simpledrawer{wood_type:f"simpledrawer:{wood_type}"} 
                run data modify storage simpledrawer:main temp.item_models set value {
                    normal:f"simpledrawer:new_drawer/{wood_type}_2", 
                    tapped:f"simpledrawer:new_drawer/{wood_type}_2_tapped"
                }

execute
    if data storage simpledrawer:main temp.simpledrawer{type:"normal",variant:"quadruple"}
    run function ~/get_model/quadruple:
        for wood_type in DRAWER_TYPES:
            execute 
                if data storage simpledrawer:main temp.simpledrawer{wood_type:f"simpledrawer:{wood_type}"} 
                run data modify storage simpledrawer:main temp.item_models set value {
                    normal:f"simpledrawer:new_drawer/{wood_type}_4", 
                    tapped:f"simpledrawer:new_drawer/{wood_type}_4_tapped"
                }
execute 
    if data storage simpledrawer:main temp.simpledrawer{type:"compacting",variant:"normal"}
    run function ~/get_model/compacting:
        execute
            if data storage simpledrawer:main temp.simpledrawer{slot_count:1b}
            run data modify storage simpledrawer:main temp.item_models set value {
                normal:"simpledrawer:new_drawer/comp_1", 
                tapped:"simpledrawer:new_drawer/comp_1_tapped"
            }
        execute
            if data storage simpledrawer:main temp.simpledrawer{slot_count:2b}
            run data modify storage simpledrawer:main temp.item_models set value {
                normal:"simpledrawer:new_drawer/comp_2", 
                tapped:"simpledrawer:new_drawer/comp_2_tapped"
            }
        execute
            if data storage simpledrawer:main temp.simpledrawer{slot_count:3b}
            run data modify storage simpledrawer:main temp.item_models set value {
                normal:"simpledrawer:new_drawer/comp_3", 
                tapped:"simpledrawer:new_drawer/comp_3_tapped"
            }


execute
    if data storage simpledrawer:main temp.simpledrawer{globalCount:0}
    run data modify storage simpledrawer:main temp.args.model set from storage simpledrawer:main temp.item_models.normal
execute
    unless data storage simpledrawer:main temp.simpledrawer{globalCount:0}
    run data modify storage simpledrawer:main temp.args.model set from storage simpledrawer:main temp.item_models.tapped



