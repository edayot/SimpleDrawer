
say filled_names

execute 
    if data storage simpledrawer:main temp.simpledrawer{type:"normal",variant:"single"} 
    run item modify entity @s container.0 {
        "function": "minecraft:set_name",
        "entity": "this",
        "target": "item_name",
        "name": {
            "translate": "simpledrawer.new_drawer.filled",
            "color": "white",
            "italic": false
        }
    }

execute
    if data storage simpledrawer:main temp.simpledrawer{type:"normal",variant:"double"}
    run item modify entity @s container.0 {
        "function": "minecraft:set_name",
        "entity": "this",
        "target": "item_name",
        "name": {
            "translate": "simpledrawer.double_new_drawer.filled",
            "color": "white",
            "italic": false
        }
    }

execute
    if data storage simpledrawer:main temp.simpledrawer{type:"normal",variant:"quadruple"}
    run item modify entity @s container.0 {
        "function": "minecraft:set_name",
        "entity": "this",
        "target": "item_name",
        "name": {
            "translate": "simpledrawer.quadruple_new_drawer.filled",
            "color": "white",
            "italic": false
        }
    }

execute
    if data storage simpledrawer:main temp.simpledrawer{type:"compacting",variant:"normal"}
    run item modify entity @s container.0 {
        "function": "minecraft:set_name",
        "entity": "this",
        "target": "item_name",
        "name": {
            "translate": "simpledrawer.compacting_new_drawer.filled",
            "color": "white",
            "italic": false
        }
    }

