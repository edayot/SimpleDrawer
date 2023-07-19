
scoreboard players set #if_empty simpledrawer.math 1

data modify storage simpledrawer:main temp.actual_upgrade set from entity @s item.tag.simpledrawer.upgrade
data modify storage simpledrawer:main temp.actual_hopper set from entity @s item.tag.simpledrawer.hopper

scoreboard players set #upgrade_success simpledrawer.math 0
execute if data storage simpledrawer:main temp{actual_upgrade:"wood",actual_hopper:1b} run function simpledrawer:impl/new_drawer/working/interaction/attack/downgrade/wood
execute if score #upgrade_success simpledrawer.math matches 0 if data storage simpledrawer:main temp{actual_upgrade:"iron"} run function simpledrawer:impl/new_drawer/working/interaction/attack/downgrade/iron
execute if score #upgrade_success simpledrawer.math matches 0 if data storage simpledrawer:main temp{actual_upgrade:"gold"} run function simpledrawer:impl/new_drawer/working/interaction/attack/downgrade/gold
execute if score #upgrade_success simpledrawer.math matches 0 if data storage simpledrawer:main temp{actual_upgrade:"diamond"} run function simpledrawer:impl/new_drawer/working/interaction/attack/downgrade/diamond
execute if score #upgrade_success simpledrawer.math matches 0 if data storage simpledrawer:main temp{actual_upgrade:"star"} run function simpledrawer:impl/new_drawer/working/interaction/attack/downgrade/star
execute if score #upgrade_success simpledrawer.math matches 0 if data storage simpledrawer:main temp{actual_upgrade:"netherite"} run function simpledrawer:impl/new_drawer/working/interaction/attack/downgrade/netherite




