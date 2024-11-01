for wood_type in ["acacia","bamboo","birch","cherry","crimson","dark_oak","jungle","mangrove","spruce","warped","oak", "ice"]:
    
    execute 
        if data storage simpledrawer:main temp.simpledrawerXX{wood_type:f"simpledrawer:{wood_type}"} 
        run data modify entity @s item.components."minecraft:item_model" set value f"simpledrawer:new_drawer/{wood_type}_4"