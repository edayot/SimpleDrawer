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

execute 
    if score #upgrade_success simpledrawer.math matches 0 
    unless score #config.disable_shulker_tape simpledrawer.math matches 1
    unless entity @s[tag=simpledrawer.new_drawer.tape]
    if data storage simpledrawer:main temp.SelectedItem.components."minecraft:custom_data".smithed{id:"airdox_:simpledrawer/shulker_tape"}
    run function ~/self_tape:
        tag @s add simpledrawer.new_drawer.tape
        scoreboard players set @s simpledrawer.new_drawer.as_players_entities 0
        scoreboard players operation #search_id simpledrawer.math = @s simpledrawer.new_drawer.id
        execute 
            at @s
            as @e[tag=simpledrawer.new_drawer.part.base_block,limit=1,predicate=simpledrawer:impl/search_id_new_drawer,distance=..10]
            run data modify entity @s item.components."minecraft:container"[0].item.components."minecraft:custom_data".simpledrawer.items_counts.0 set value 1
        
        item modify entity @p[tag=simpledrawer.attacker] weapon.mainhand {function:"minecraft:set_damage",damage:-0.04,add:true}
        execute
            as @p[tag=simpledrawer.attacker]
            if items entity @s weapon.mainhand *[minecraft:damage=40]
            run function ~/break_weapon:
                item replace entity @s weapon.mainhand with minecraft:air
                playsound minecraft:entity.item.break player @s

        kill @e[
            tag=simpledrawer.new_drawer.part,
            tag=!simpledrawer.new_drawer.part.base_block,
            tag=!simpledrawer.new_drawer.part.base,
            tag=!simpledrawer.new_drawer.part.interaction,
            predicate=simpledrawer:impl/search_id_new_drawer
        ]



execute if score #upgrade_success simpledrawer.math matches 1 as @p[tag=simpledrawer.attacker] at @s run playsound minecraft:block.anvil.use block @s ~ ~ ~ 0.5 2
