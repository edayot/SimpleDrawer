$item modify entity @s container.0 { \
    "function": "minecraft:set_lore", \
    "lore": [ \
        [ \
            { \
                "text": "$(globalCount)", \
                "color": "dark_gray", \
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
