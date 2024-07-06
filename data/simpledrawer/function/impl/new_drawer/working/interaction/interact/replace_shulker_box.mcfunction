$item modify entity @p[tag=simpledrawer.interacter] weapon.mainhand { \
    "function": "minecraft:set_components", \
    "components": { \
        "minecraft:container": $(container) \
    } \
}

$say $(container)