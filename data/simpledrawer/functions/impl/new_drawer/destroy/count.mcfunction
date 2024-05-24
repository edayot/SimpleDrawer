$item modify entity @s container.0 { \
    "function": "minecraft:set_lore", \
    "lore": [ \
        [ \
            { \
                "text": "$(globalCount)", \
                "color": "gray", \
                "italic": false \
            }, \
            { \
                "text": "/", \
            }, \
            { \
                "text": "$(maxCount)", \
            } \
        ] \
    ], \
    "mode": "append" \
}
