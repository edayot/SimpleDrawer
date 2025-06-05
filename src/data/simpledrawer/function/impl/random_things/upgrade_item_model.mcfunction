# @public


advancement revoke @s only simpledrawer:impl/upgrade_item_model/1430000
advancement revoke @s only simpledrawer:impl/upgrade_item_model/1430001
advancement revoke @s only simpledrawer:impl/upgrade_item_model/1430002
advancement revoke @s only simpledrawer:impl/upgrade_item_model/1430003
advancement revoke @s only simpledrawer:impl/upgrade_item_model/1430004
advancement revoke @s only simpledrawer:impl/upgrade_item_model/1430005
advancement revoke @s only simpledrawer:impl/upgrade_item_model/1430006
advancement revoke @s only simpledrawer:impl/upgrade_item_model/1430007


data modify storage simpledrawer:main temp.InventoryUpgrade set value []
data modify storage simpledrawer:main temp.InventoryUpgrade append from entity @s Inventory[{components:{"minecraft:custom_data":{ctc:{from:"airdox_:simpledrawer"}}}}]


execute 
    if data storage simpledrawer:main temp.InventoryUpgrade[0]
    run function ~/test_upgrade:
        execute 
            if data storage simpledrawer:main temp.InventoryUpgrade[0].components."minecraft:item_model"
            run return run function ~/early_stop:
                data remove storage simpledrawer:main temp.InventoryUpgrade[0]
                execute 
                    if data storage simpledrawer:main temp.InventoryUpgrade[0]
                    run function ~/../
        
        data modify storage simpledrawer:main temp.args set value {slot:-1, model:""}
        data modify storage simpledrawer:main temp.args.slot set from storage simpledrawer:main temp.InventoryUpgrade[0].Slot
        execute
            if data storage simpledrawer:main temp.InventoryUpgrade[0].components."minecraft:custom_data".ctc{id:"new_drawer"}
            run data modify storage simpledrawer:main temp.args.model set value "simpledrawer:new_drawer"
        execute
            if data storage simpledrawer:main temp.InventoryUpgrade[0].components."minecraft:custom_data".ctc{id:"hopper_upgrade"}
            run data modify storage simpledrawer:main temp.args.model set value "simpledrawer:hopper_upgrade"
        execute
            if data storage simpledrawer:main temp.InventoryUpgrade[0].components."minecraft:custom_data".ctc{id:"iron_upgrade"}
            run data modify storage simpledrawer:main temp.args.model set value "simpledrawer:iron_upgrade"
        execute
            if data storage simpledrawer:main temp.InventoryUpgrade[0].components."minecraft:custom_data".ctc{id:"gold_upgrade"}
            run data modify storage simpledrawer:main temp.args.model set value "simpledrawer:gold_upgrade"
        execute
            if data storage simpledrawer:main temp.InventoryUpgrade[0].components."minecraft:custom_data".ctc{id:"diamond_upgrade"}
            run data modify storage simpledrawer:main temp.args.model set value "simpledrawer:diamond_upgrade"
        execute
            if data storage simpledrawer:main temp.InventoryUpgrade[0].components."minecraft:custom_data".ctc{id:"star_upgrade"}
            run data modify storage simpledrawer:main temp.args.model set value "simpledrawer:star_upgrade"
        execute
            if data storage simpledrawer:main temp.InventoryUpgrade[0].components."minecraft:custom_data".ctc{id:"netherite_upgrade"}
            run data modify storage simpledrawer:main temp.args.model set value "simpledrawer:netherite_upgrade"
        execute
            if data storage simpledrawer:main temp.InventoryUpgrade[0].components."minecraft:custom_data".ctc{id:"downgrade_wrench"}
            run data modify storage simpledrawer:main temp.args.model set value "simpledrawer:downgrade_wrench"

        function ~/modify with storage simpledrawer:main temp.args

        function ~/modify:
            $item modify entity @s container.$(slot) { \
                "function": "minecraft:set_components", \
                "components": { \
                    "minecraft:item_model": "$(model)", \
                    "!minecraft:custom_model_data": {} \
                } \
            }
        
        data remove storage simpledrawer:main temp.InventoryUpgrade[0]
        execute 
            if data storage simpledrawer:main temp.InventoryUpgrade[0]
            run function ~/


