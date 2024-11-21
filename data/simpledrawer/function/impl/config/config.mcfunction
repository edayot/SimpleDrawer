# @public
from copy import deepcopy



def get_text(
    name: str,
    description: str,
    values: list[str], 
    default_value: str,
    current_value: str,
    command: str
    ): 
    text = [
        "",
        {
            "text": f"{name} : ",
            "color": "green",
            "hoverEvent": {
                "action": "show_text",
                "contents": description
            }
        }
    ]
    for value in values:
        is_default = value == default_value
        default_text = ""
        if is_default:
            default_text = " (default)"
        is_current = value == current_value
        current_text = ""
        if is_current:
            current_text = " (current)"
        text.append({
            "text": f" {value} ",
            "bold": is_default,
            "underlined": is_current,
            "hoverEvent": {
                "action": "show_text",
                "contents": f"Click to set \"{name}\" to {value}{default_text}{current_text}"
            },
            "clickEvent": {
                "action": "run_command",
                "value": command+"/"+value
            }
        })
    return text

def config_scoreboard(
    name: str,
    description: str,
    scoreboard: str, 
    values: list[str], 
    default_value: str,
    ): 
    scoreboard players set #temp.success simpledrawer.math 0
    for value in values:
        scoreboard_trimmed = scoreboard.replace("#", "")
        func_name = f"simpledrawer:impl/config/set_scoreboard/{scoreboard_trimmed}"
        function f"{func_name}/{value}":
            scoreboard players set f"{scoreboard}" simpledrawer.math f"{value}"
            function simpledrawer:config
        
        command = f"/function {func_name}"
        text = get_text(
            name=name, 
            description=description, 
            values=values, 
            default_value=default_value, 
            current_value=value,
            command=command,
        )
        execute 
            if score f"{scoreboard}" simpledrawer.math matches f"{value}" 
            run function f"simpledrawer:impl/config/print/{scoreboard_trimmed}/{value}":
                tellraw @s text
                scoreboard players set #temp.success simpledrawer.math 1
    text = get_text(
        name=name, 
        description=description, 
        values=values, 
        default_value=default_value, 
        current_value="",
        command=f"/function simpledrawer:impl/config/set_scoreboard/{scoreboard}",
    )
    execute
        unless score #temp.success simpledrawer.math matches 1
        run tellraw @s text

    

def config_storage(
    name: str,
    description: str,
    storage: str, 
    values: list[str], 
    default_value: str,
    allow_custom: bool = False,
    ): 
    if not allow_custom:    
        scoreboard players set #temp.success simpledrawer.math 0
        for value in values:
            func_name = f"simpledrawer:impl/config/set_storage/{storage}"
            function f"{func_name}/{value}":
                data modify storage simpledrawer:main f"{storage}" set value f"{value}"
                function simpledrawer:config
            
            command = f"/function {func_name}"
            text = get_text(
                name=name, 
                description=description, 
                values=values, 
                default_value=default_value, 
                current_value=value,
                command=command,
            )
            last = storage.split(".")[-1]
            start = storage.removesuffix("."+last)
            execute 
                if data storage simpledrawer:main f"{start}{{{last}:\"{value}\"}}" 
                run function f"simpledrawer:impl/config/print/{storage}/{value}":
                    tellraw @s text
                    scoreboard players set #temp.success simpledrawer.math 1
        text = get_text(
            name=name, 
            description=description, 
            values=values, 
            default_value=default_value, 
            current_value="",
            command=f"/function simpledrawer:impl/config/set_storage/{storage}",
        )
        execute
            unless score #temp.success simpledrawer.math matches 1
            run tellraw @s text
    else:
        func_name = f"simpledrawer:impl/config/set_storage/{storage.lower()}/reset"
        function func_name:
            data modify storage simpledrawer:main storage set value default_value
            function simpledrawer:config
        text_custom = ["",]
        text_default = ["",]
        x = {
            "text": f"{name} : ",
            "color": "green",
            "hoverEvent": {
                "action": "show_text",
                "contents": description
            }
        }
        text_custom.append(x)
        text_default.append(x)
        default = {
            "text": f" {default_value} ",
            "bold": True,
            "hoverEvent": {
                "action": "show_text",
                "contents": f"Click to reset \"{name}\" to {default_value}"
            },
            "clickEvent": {
                "action": "run_command",
                "value": f"/function {func_name}"
            }
        }
        text_custom.append(deepcopy(default))
        default["underlined"] = True
        text_default.append(deepcopy(default))
        custom = {
            "text": " Custom ",
            "bold": False,
            "hoverEvent": {
                "action": "show_text",
                "contents": f"Click to set a custom value for \"{name}\""
            },
            "clickEvent": {
                "action": "suggest_command",
                "value": f"/data modify storage simpledrawer:main {storage} set value {default_value}"
            },
        }
        text_default.append(deepcopy(custom))
        custom["underlined"] = True
        text_custom.append(deepcopy(custom))
        last = storage.split(".")[-1]
        start = storage.removesuffix("."+last)
        if isinstance(default_value, str):
            if_data = f"{start}{{{last}:\"{default_value}\"}}"
        else:
            if_data = f"{start}{{{last}:{default_value}}}"
        execute
            if data storage simpledrawer:main f"{if_data}"
            run tellraw @s text_default
        execute
            unless data storage simpledrawer:main f"{if_data}"
            run tellraw @s text_custom

    




tellraw @s "\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
tellraw @s [
    "",
    {"translate":"simpledrawer.tellraw_prefix","color":"yellow","bold":true},
    {"text":"Configuration","color":"green"},
]
tellraw @s [
    "",
    {"text":"LOD : \n","color":"green"}, 
    {"text":"Drawer that are far away reduce their number of entities, to increase performance", "color":"gray"}
]
config_scoreboard(
    "LOD Reconstruction",
    "The maximum number of drawer that resummon on the same tick",
    "#config.max_resummon", 
    ["1", "2", "3", "4", "5", "10"], 
    "4"
)
config_storage(
    "LOD Range",
    "The drawer view distance for player",
    "config.resummon_range", 
    ["4", "8", "12", "16", "32", "64", "128", "256"],
    "16"
) 
tellraw @s "\n"
tellraw @s [
    "",
    {"text":"Gameplay : \n","color":"green"}, 
    {"text":"Options about player using a drawer", "color":"gray"},
]
config_scoreboard(
    "Alternative Compacting",
    "Allow sand to sandstone, clay to clayblock, quartz to quartzblock, red sand to red sandstone in the compacting drawer",
    "#config.alternative_compacting", 
    ["0", "1"],
    "0"
)
config_storage(
    "Drawer Capacity",
    "The maximum number of items that can be stored in a normal drawer",
    "drawer_type.wood.maxCount", 
    [],
    256,
    True,
)
config_storage(
    "Iron Upgrade Capacity",
    "The maximum number of items that can be stored in a drawer with an iron upgrade",
    "drawer_type.iron.maxCount", 
    [],
    2048,
    True,
)
config_storage(
    "Gold Upgrade Capacity",
    "The maximum number of items that can be stored in a drawer with a gold upgrade",
    "drawer_type.gold.maxCount", 
    [],
    8192,
    True,
)
config_storage(
    "Diamond Upgrade Capacity",
    "The maximum number of items that can be stored in a drawer with a diamond upgrade",
    "drawer_type.diamond.maxCount", 
    [],
    65536,
    True,
)
config_storage(
    "Star Upgrade Capacity",
    "The maximum number of items that can be stored in a drawer with a star upgrade",
    "drawer_type.star.maxCount", 
    [],
    1048576,
    True,
)
config_storage(
    "Netherite Upgrade Capacity",
    "The maximum number of items that can be stored in a drawer with a netherite upgrade",
    "drawer_type.netherite.maxCount", 
    [],
    1073741824,
    True,
)






