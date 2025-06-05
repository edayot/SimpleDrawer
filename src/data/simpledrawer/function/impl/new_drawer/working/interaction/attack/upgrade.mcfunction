scoreboard players set #if_upgrade simpledrawer.math 1

data modify storage simpledrawer:main temp.actual_upgrade set from entity @s item.components."minecraft:custom_data".simpledrawer.upgrade
data modify storage simpledrawer:main temp.actual_hopper set from entity @s item.components."minecraft:custom_data".simpledrawer.hopper

scoreboard players set #upgrade_success simpledrawer.math 0

execute if data storage simpledrawer:main temp{actual_upgrade:"wood"} if data storage simpledrawer:main temp.SelectedItem.components."minecraft:custom_data".smithed{id:"airdox_:simpledrawer/iron_upgrade"} run function simpledrawer:impl/new_drawer/working/interaction/attack/upgrade/iron
execute if score #upgrade_success simpledrawer.math matches 0 if data storage simpledrawer:main temp{actual_upgrade:"iron"} if data storage simpledrawer:main temp.SelectedItem.components."minecraft:custom_data".smithed{id:"airdox_:simpledrawer/gold_upgrade"} run function simpledrawer:impl/new_drawer/working/interaction/attack/upgrade/gold
execute if score #upgrade_success simpledrawer.math matches 0 if data storage simpledrawer:main temp{actual_upgrade:"gold"} if data storage simpledrawer:main temp.SelectedItem.components."minecraft:custom_data".smithed{id:"airdox_:simpledrawer/diamond_upgrade"} run function simpledrawer:impl/new_drawer/working/interaction/attack/upgrade/diamond
execute if score #upgrade_success simpledrawer.math matches 0 if data storage simpledrawer:main temp{actual_upgrade:"diamond"} if data storage simpledrawer:main temp.SelectedItem.components."minecraft:custom_data".smithed{id:"airdox_:simpledrawer/star_upgrade"} run function simpledrawer:impl/new_drawer/working/interaction/attack/upgrade/star
execute if score #upgrade_success simpledrawer.math matches 0 if data storage simpledrawer:main temp{actual_upgrade:"star"} if data storage simpledrawer:main temp.SelectedItem.components."minecraft:custom_data".smithed{id:"airdox_:simpledrawer/netherite_upgrade"} run function simpledrawer:impl/new_drawer/working/interaction/attack/upgrade/netherite


execute if score #upgrade_success simpledrawer.math matches 0 if data storage simpledrawer:main temp{actual_hopper:0b} if data storage simpledrawer:main temp.SelectedItem.components."minecraft:custom_data".smithed{id:"airdox_:simpledrawer/hopper_upgrade"} run function simpledrawer:impl/new_drawer/working/interaction/attack/upgrade/hopper



execute if score #upgrade_success simpledrawer.math matches 1 as @p[tag=simpledrawer.attacker] at @s run playsound minecraft:block.anvil.use block @s ~ ~ ~ 0.5 2
