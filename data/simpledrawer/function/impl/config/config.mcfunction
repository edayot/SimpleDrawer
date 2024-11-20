# @public



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
            run function f"simpledrawer:config/print/{scoreboard_trimmed}/{value}":
                tellraw @s text
                scoreboard players set #temp.success simpledrawer.math 1
    text = get_text(
        name=name, 
        description=description, 
        values=values, 
        default_value=default_value, 
        current_value="",
        command=f"/function simpledrawer:config/set_scoreboard/{scoreboard}",
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
    ): 
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
            run function f"simpledrawer:config/print/{storage}/{value}":
                tellraw @s text
                scoreboard players set #temp.success simpledrawer.math 1
    text = get_text(
        name=name, 
        description=description, 
        values=values, 
        default_value=default_value, 
        current_value="",
        command=f"/function simpledrawer:config/set_storage/{storage}",
    )
    execute
        unless score #temp.success simpledrawer.math matches 1
        run tellraw @s text
    




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




