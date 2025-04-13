

scoreboard players set #temp_upgrade simpledrawer.math 0
execute if data storage simpledrawer:main temp.simpledrawer{hopper:1b} run scoreboard players set #temp_upgrade simpledrawer.math 1
execute if data storage simpledrawer:main temp.simpledrawer{upgrade:"iron"} run scoreboard players set #temp_upgrade simpledrawer.math 1
execute if data storage simpledrawer:main temp.simpledrawer{upgrade:"gold"} run scoreboard players set #temp_upgrade simpledrawer.math 1
execute if data storage simpledrawer:main temp.simpledrawer{upgrade:"diamond"} run scoreboard players set #temp_upgrade simpledrawer.math 1
execute if data storage simpledrawer:main temp.simpledrawer{upgrade:"star"} run scoreboard players set #temp_upgrade simpledrawer.math 1
execute if data storage simpledrawer:main temp.simpledrawer{upgrade:"netherite"} run scoreboard players set #temp_upgrade simpledrawer.math 1

execute if score #temp_upgrade simpledrawer.math matches 1 run item modify entity @s container.0 {
	"function": "minecraft:set_lore",
	"lore": [
		{
			"text": "",
		}
	],
	"mode": "append"
}

execute if data storage simpledrawer:main temp.simpledrawer{hopper:1b} run item modify entity @s container.0 {
	"function": "minecraft:set_lore",
	"lore": [
		{
			"translate": "simpledrawer.hopper_tier",
			"color": "dark_gray"
		}
	],
	"mode": "append"
}

execute if data storage simpledrawer:main temp.simpledrawer{upgrade:"iron"} run item modify entity @s container.0 {
    "function": "minecraft:set_lore",
    "lore": [
        {
            "translate": "simpledrawer.iron_tier",
            "color": "gray"
        }
    ],
    "mode": "append"
}

execute if data storage simpledrawer:main temp.simpledrawer{upgrade:"gold"} run item modify entity @s container.0 {
    "function": "minecraft:set_lore",
    "lore": [
        {
            "translate": "simpledrawer.gold_tier",
            "color": "gray"
        }
    ],
    "mode": "append"
}

execute if data storage simpledrawer:main temp.simpledrawer{upgrade:"diamond"} run item modify entity @s container.0 {
    "function": "minecraft:set_lore",
    "lore": [
        {
            "translate": "simpledrawer.diamond_tier",
            "color": "gray"
        }
    ],
    "mode": "append"
}

execute if data storage simpledrawer:main temp.simpledrawer{upgrade:"star"} run item modify entity @s container.0 {
    "function": "minecraft:set_lore",
    "lore": [
        {
            "translate": "simpledrawer.star_tier",
            "color": "white"
        }
    ],
    "mode": "append"
}

execute if data storage simpledrawer:main temp.simpledrawer{upgrade:"netherite"} run item modify entity @s container.0 {
    "function": "minecraft:set_lore",
    "lore": [
        {
            "translate": "simpledrawer.netherite_tier",
            "color": "aqua"
        }
    ],
    "mode": "append"
}