
result_template = """function simpledrawer:impl/config/save_config {
lod_reconstruction: \\$(lod_reconstruction),
lod_range: \\$(lod_range),
alternative_compacting: \\$(alternative_compacting),
iron_capacity: \\$(iron_capacity),
gold_capacity: \\$(gold_capacity),
diamond_capacity: \\$(diamond_capacity),
star_capacity: \\$(star_capacity),
netherite_capacity: \\$(netherite_capacity)
}
""".replace("\n", "")

dialog = {
    "type": "minecraft:multi_action",
    "title": "SimpleDrawer Configuration",
    "body": [
        {
            "type": "minecraft:plain_message",
            "contents": {
                "text": "Description of configurations",
                "hover_event": {
                    "action": "show_text",
                    "value": [
                        [
                            {
                                "text": "LOD Reconstruction: "
                            },
                            {
                                "text": "The maximum number of drawer that resummon on the same tick\n\n",
                                "color": "#77767b"
                            }
                        ],
                        [
                            {
                                "text": "LOD Range: "
                            },
                            {
                                "text": "The drawer view distance for player\n\n",
                                "color": "#77767b"
                            }
                        ],
                        [
                            {
                                "text": "Alternative Compacting: "
                            },
                            {
                                "text": "Allow sand to sandstone, clay to clayblock, quartz to quartzblock, red sand to red sandstone in the compacting drawer\n\n",
                                "color": "#77767b"
                            }
                        ],
                        [
                            {
                                "text": "Iron Capacity: "
                            },
                            {
                                "text": "The maximum number of items that can be stored in a drawer with an iron upgrade\n\n",
                                "color": "#77767b"
                            }
                        ],
                        [
                            {
                                "text": "Gold Capacity: "
                            },
                            {
                                "text": "The maximum number of items that can be stored in a drawer with a gold upgrade\n\n",
                                "color": "#77767b"
                            }
                        ],
                        [
                            {
                                "text": "Diamond Capacity: "
                            },
                            {
                                "text": "The maximum number of items that can be stored in a drawer with a diamond upgrade\n\n",
                                "color": "#77767b"
                            }
                        ],
                        [
                            {
                                "text": "Star Capacity: "
                            },
                            {
                                "text": "The maximum number of items that can be stored in a drawer with a star upgrade\n\n",
                                "color": "#77767b"
                            }
                        ],
                        [
                            {
                                "text": "Netherite Capacity: "
                            },
                            {
                                "text": "The maximum number of items that can be stored in a drawer with a netherite upgrade",
                                "color": "#77767b"
                            }
                        ]
                    ]
                }
            }
        }
    ],
    "inputs": [
        {
            "type": "minecraft:number_range",
            "key": "lod_reconstruction",
            "label": "LOD Reconstruction",
            "start": 1,
            "end": 10,
            "step": 1,
            "initial": "__lod_reconstruction__"
        },
        {
            "type": "minecraft:number_range",
            "key": "lod_range",
            "label": "LOD Range",
            "start": 2,
            "end": 256,
            "step": 4,
            "initial": "__lod_range__"
        },
        {
            "type": "minecraft:boolean",
            "key": "alternative_compacting",
            "label": "Alternative Compacting",
            "on_true": "1",
            "on_false": "0",
            "initial": "__alternative_compacting__"
        },
        {
            "type": "minecraft:number_range",
            "key": "iron_capacity",
            "label": "Iron Capacity",
            "start": 256,
            "end": 8192,
            "step": 1,
            "initial": "__iron_capacity__"
        },
        {
            "type": "minecraft:number_range",
            "key": "gold_capacity",
            "label": "Gold Capacity",
            "start": 256,
            "end": 32768,
            "step": 1,
            "initial": "__gold_capacity__"
        },
        {
            "type": "minecraft:number_range",
            "key": "diamond_capacity",
            "label": "Diamond Capacity",
            "start": 256,
            "end": 262144,
            "step": 1,
            "initial": "__diamond_capacity__"
        },
        {
            "type": "minecraft:number_range",
            "key": "star_capacity",
            "label": "Star Capacity",
            "start": 256,
            "end": 4194304,
            "step": 1,
            "initial": "__star_capacity__"
        },
        {
            "type": "minecraft:number_range",
            "key": "netherite_capacity",
            "label": "Netherite Capacity",
            "start": 256,
            "end": 2147483647,
            "step": 1,
            "initial": "__netherite_capacity__"
        }
    ],
    "after_action": "close",
    "actions": [
        {
            "label": "Save configuration",
            "action": {
                "type": "dynamic/run_command",
                "template": "__result_template__",
            }
        },
        {
            "label": "Reset default",
            "action": {
                "type": "run_command",
                "command": "function simpledrawer:impl/config/load_default"
            }
        },
        {
            "label": "Cancel",
        }
    ]
}
import json
dialog = json.dumps(dialog)

dialog = dialog.replace("__result_template__", result_template.replace("\\$", "\\u0024"))
dialog = dialog.replace("\"__lod_reconstruction__\"", "$(lod_reconstruction)")
dialog = dialog.replace("\"__lod_range__\"", "$(lod_range)")
dialog = dialog.replace("\"__alternative_compacting__\"", "$(alternative_compacting)")
dialog = dialog.replace("\"__iron_capacity__\"", "$(iron_capacity)")
dialog = dialog.replace("\"__gold_capacity__\"", "$(gold_capacity)")
dialog = dialog.replace("\"__diamond_capacity__\"", "$(diamond_capacity)")
dialog = dialog.replace("\"__star_capacity__\"", "$(star_capacity)")
dialog = dialog.replace("\"__netherite_capacity__\"", "$(netherite_capacity)")


raw f"$dialog show @s {dialog}"