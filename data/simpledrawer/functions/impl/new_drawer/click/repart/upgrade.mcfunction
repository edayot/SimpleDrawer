

scoreboard players set #upgrade_success simpledrawer.math 0
data modify storage simpledrawer:main temp.actual_type set from entity @s Item.tag.simpledrawer.type
data modify storage simpledrawer:main temp.actual_hopper set from entity @s Item.tag.simpledrawer.hopper

#Check upgrade iron gold diamond star and netherite
execute if score #upgrade_success simpledrawer.math matches 0 if data storage simpledrawer:main temp{actual_type:"wood"} if data storage simpledrawer:main temp.ItemInput.tag.ctc{id:"iron_upgrade",from:"airdox_:simpledrawer"} run function simpledrawer:impl/new_drawer/click/repart/upgrade/iron
execute if score #upgrade_success simpledrawer.math matches 0 if data storage simpledrawer:main temp{actual_type:"iron"} if data storage simpledrawer:main temp.ItemInput.tag.ctc{id:"gold_upgrade",from:"airdox_:simpledrawer"} run function simpledrawer:impl/new_drawer/click/repart/upgrade/gold
execute if score #upgrade_success simpledrawer.math matches 0 if data storage simpledrawer:main temp{actual_type:"gold"} if data storage simpledrawer:main temp.ItemInput.tag.ctc{id:"diamond_upgrade",from:"airdox_:simpledrawer"} run function simpledrawer:impl/new_drawer/click/repart/upgrade/diamond
execute if score #upgrade_success simpledrawer.math matches 0 if data storage simpledrawer:main temp{actual_type:"diamond"} if data storage simpledrawer:main temp.ItemInput.tag.ctc{id:"star_upgrade",from:"airdox_:simpledrawer"} run function simpledrawer:impl/new_drawer/click/repart/upgrade/star
execute if score #upgrade_success simpledrawer.math matches 0 if data storage simpledrawer:main temp{actual_type:"star"} if data storage simpledrawer:main temp.ItemInput.tag.ctc{id:"netherite_upgrade",from:"airdox_:simpledrawer"} run function simpledrawer:impl/new_drawer/click/repart/upgrade/netherite

execute if score #upgrade_success simpledrawer.math matches 0 if data storage simpledrawer:main temp{actual_hopper:0b} if data storage simpledrawer:main temp.ItemInput.tag.ctc{id:"hopper_upgrade",from:"airdox_:simpledrawer"} run function simpledrawer:impl/new_drawer/click/repart/upgrade/hopper


execute if score #upgrade_success simpledrawer.math matches 1 run function simpledrawer:impl/new_drawer/click/repart/upgrade/success