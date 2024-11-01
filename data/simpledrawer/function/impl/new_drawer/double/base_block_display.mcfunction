from simpledrawer import DRAWER_TYPES

for wood_type in DRAWER_TYPES:
    execute 
        if data storage simpledrawer:main temp.simpledrawerXX{wood_type:f"simpledrawer:{wood_type}"} 
        run data modify entity @s item.components."minecraft:item_model" set value f"simpledrawer:new_drawer/{wood_type}_2"