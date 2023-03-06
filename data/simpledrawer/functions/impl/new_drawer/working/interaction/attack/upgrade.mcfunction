scoreboard players set #if_upgrade simpledrawer.math 1

data modify storage simpledrawer:main temp.actual_upgrade set from entity @s item.tag.simpledrawer.upgrade
data modify storage simpledrawer:main temp.actual_hopper set from entity @s item.tag.simpledrawer.hopper

scoreboard players set #upgrade_success simpledrawer.math 0

execute if data storage simpledrawer:main temp{actual_upgrade:"wood"} if data storage simpledrawer:main temp.SelectedItem.tag.ctc{id:"iron_upgrade",from:"airdox_:simpledrawer"} run function simpledrawer:impl/new_drawer/working/interaction/attack/upgrade/iron
execute if score #upgrade_success simpledrawer.math matches 0 if data storage simpledrawer:main temp{actual_upgrade:"iron"} if data storage simpledrawer:main temp.SelectedItem.tag.ctc{id:"gold_upgrade",from:"airdox_:simpledrawer"} run function simpledrawer:impl/new_drawer/working/interaction/attack/upgrade/gold
execute if score #upgrade_success simpledrawer.math matches 0 if data storage simpledrawer:main temp{actual_upgrade:"gold"} if data storage simpledrawer:main temp.SelectedItem.tag.ctc{id:"diamond_upgrade",from:"airdox_:simpledrawer"} run function simpledrawer:impl/new_drawer/working/interaction/attack/upgrade/diamond
execute if score #upgrade_success simpledrawer.math matches 0 if data storage simpledrawer:main temp{actual_upgrade:"diamond"} if data storage simpledrawer:main temp.SelectedItem.tag.ctc{id:"star_upgrade",from:"airdox_:simpledrawer"} run function simpledrawer:impl/new_drawer/working/interaction/attack/upgrade/star
execute if score #upgrade_success simpledrawer.math matches 0 if data storage simpledrawer:main temp{actual_upgrade:"star"} if data storage simpledrawer:main temp.SelectedItem.tag.ctc{id:"netherite_upgrade",from:"airdox_:simpledrawer"} run function simpledrawer:impl/new_drawer/working/interaction/attack/upgrade/netherite


execute if score #upgrade_success simpledrawer.math matches 0 if data storage simpledrawer:main temp{actual_hopper:0b} if data storage simpledrawer:main temp.SelectedItem.tag.ctc{id:"hopper_upgrade",from:"airdox_:simpledrawer"} run function simpledrawer:impl/new_drawer/working/interaction/attack/upgrade/hopper



