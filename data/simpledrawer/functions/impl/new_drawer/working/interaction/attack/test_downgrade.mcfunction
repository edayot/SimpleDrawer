scoreboard players set #if_upgrade simpledrawer.math 1

scoreboard players set #if_empty simpledrawer.math 0
execute if data entity @s item.components."minecraft:custom_data".simpledrawer{globalCount:0} run function simpledrawer:impl/new_drawer/working/interaction/attack/downgrade
execute if score #if_empty simpledrawer.math matches 0 run title @p[tag=simpledrawer.attacker,tag=!global.ignore.gui] actionbar [{"translate":"simpledrawer.tellraw_prefix","color":"dark_red"},{"translate":"simpledrawer.text.cant_downgrade","color":"red"}]

