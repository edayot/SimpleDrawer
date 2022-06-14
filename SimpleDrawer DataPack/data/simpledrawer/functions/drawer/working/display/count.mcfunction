scoreboard players set #count simpledrawer.math 0
execute store result score #count simpledrawer.math run data get entity @s Item.tag.simpledrawer.Item.Count
scoreboard players operation #maxCount simpledrawer.math = @s simpledrawer.drawer.maxCount
item modify entity @s container.0 simpledrawer:set_item_name
