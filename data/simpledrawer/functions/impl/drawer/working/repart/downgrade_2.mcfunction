
scoreboard players set #downgrade_success simpledrawer.math 0
data modify storage simpledrawer:main temp.actual_type set from entity @s Item.tag.simpledrawer.type
data modify storage simpledrawer:main temp.actual_hopper set from entity @s Item.tag.simpledrawer.hopper


#Check downgrade iron gold diamond star and netherite
execute if score #downgrade_success simpledrawer.math matches 0 if data storage simpledrawer:main temp{actual_type:"wood"} if data storage simpledrawer:main temp{hopper:1b} store success score #downgrade_success simpledrawer.math run function simpledrawer:impl/drawer/working/repart/downgrade/wood 
execute if score #downgrade_success simpledrawer.math matches 0 if data storage simpledrawer:main temp{actual_type:"iron"} store success score #downgrade_success simpledrawer.math run function simpledrawer:impl/drawer/working/repart/downgrade/iron 
execute if score #downgrade_success simpledrawer.math matches 0 if data storage simpledrawer:main temp{actual_type:"gold"} store success score #downgrade_success simpledrawer.math run function simpledrawer:impl/drawer/working/repart/downgrade/gold
execute if score #downgrade_success simpledrawer.math matches 0 if data storage simpledrawer:main temp{actual_type:"diamond"} store success score #downgrade_success simpledrawer.math run function simpledrawer:impl/drawer/working/repart/downgrade/diamond
execute if score #downgrade_success simpledrawer.math matches 0 if data storage simpledrawer:main temp{actual_type:"star"} store success score #downgrade_success simpledrawer.math run function simpledrawer:impl/drawer/working/repart/downgrade/star
execute if score #downgrade_success simpledrawer.math matches 0 if data storage simpledrawer:main temp{actual_type:"netherite"} store success score #downgrade_success simpledrawer.math run function simpledrawer:impl/drawer/working/repart/downgrade/netherite

execute if score #downgrade_success simpledrawer.math matches 1 run function simpledrawer:impl/drawer/working/repart/downgrade_3