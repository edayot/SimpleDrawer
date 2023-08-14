#define storage simpledrawer:main
#define storage simpledrawer:io



scoreboard players set simpledrawer load.status 1
function simpledrawer:impl/set_version

gamerule maxCommandChainLength 2147483647


#Drawer
data modify storage simpledrawer:main ItemsNBT.drawer set value {id:"minecraft:furnace",Count:1b						,tag:{ctc:{id:"drawer",from:"airdox_:simpledrawer",traits:{"block":1b}}										,BlockEntityTag:{Items:[{id:"minecraft:stone",Count:1b,Slot:0b,tag:{simpledrawer:{type:"wood",hopper:0b},smithed:{block:{id:"simpledrawer:drawer"}}}}]}							,display:{Name:'{"translate":"simpledrawer.drawer.empty","color":"white","italic":false}'}}}

data modify storage simpledrawer:main ItemsNBT.new_drawer set value {id:"minecraft:furnace",Count:1b						,tag:{CustomModelData:1430000,Trim:{material:"simpledrawer:oak",pattern:"minecraft:sentry"},HideFlags:128,ctc:{id:"new_drawer",from:"airdox_:simpledrawer",traits:{"block":1b}}										,BlockEntityTag:{Items:[{id:"minecraft:stone",Count:1b,Slot:0b,tag:{simpledrawer:{type:"normal",variant:"single",wood_type:"simpledrawer:oak",upgrade:"wood",hopper:0b,globalCount:0,maxCount:256},smithed:{block:{id:"simpledrawer:new_drawer"}}}}]}							,display:{Name:'{"translate":"simpledrawer.new_drawer.empty","color":"white","italic":false}',Lore:['{"translate":"simpledrawer.name","color":"blue","italic":true}']}}}
data modify storage simpledrawer:main ItemsNBT.double_new_drawer set value {id:"minecraft:furnace",Count:1b						,tag:{CustomModelData:1430001,Trim:{material:"simpledrawer:oak",pattern:"minecraft:sentry"},HideFlags:128,ctc:{id:"new_drawer",from:"airdox_:simpledrawer",traits:{"block":1b}}										,BlockEntityTag:{Items:[{id:"minecraft:stone",Count:1b,Slot:0b,tag:{simpledrawer:{type:"normal",variant:"double",wood_type:"simpledrawer:oak",upgrade:"wood",hopper:0b,globalCount:0,maxCount:256},smithed:{block:{id:"simpledrawer:new_drawer"}}}}]}							,display:{Name:'{"translate":"simpledrawer.double_new_drawer.empty","color":"white","italic":false}',Lore:['{"translate":"simpledrawer.name","color":"blue","italic":true}']}}}
data modify storage simpledrawer:main ItemsNBT.quadruple_new_drawer set value {id:"minecraft:furnace",Count:1b						,tag:{CustomModelData:1430002,Trim:{material:"simpledrawer:oak",pattern:"minecraft:sentry"},HideFlags:128,ctc:{id:"new_drawer",from:"airdox_:simpledrawer",traits:{"block":1b}}										,BlockEntityTag:{Items:[{id:"minecraft:stone",Count:1b,Slot:0b,tag:{simpledrawer:{type:"normal",variant:"quadruple",wood_type:"simpledrawer:oak",upgrade:"wood",hopper:0b,globalCount:0,maxCount:256},smithed:{block:{id:"simpledrawer:new_drawer"}}}}]}							,display:{Name:'{"translate":"simpledrawer.quadruple_new_drawer.empty","color":"white","italic":false}',Lore:['{"translate":"simpledrawer.name","color":"blue","italic":true}']}}}

data modify storage simpledrawer:main ItemsNBT.compacting_new_drawer set value {id:"minecraft:furnace",Count:1b,tag:{
    CustomModelData:1430000,
    Trim:{material:"simpledrawer:compacting",pattern:"minecraft:sentry"},
    HideFlags:128,
    ctc:{id:"new_drawer",from:"airdox_:simpledrawer",traits:{"block":1b}},
    display:{
        Name:'{"translate":"simpledrawer.compacting_new_drawer.empty","color":"white","italic":false}',
        Lore:['{"translate":"simpledrawer.name","color":"blue","italic":true}']},

    BlockEntityTag:{Items:[{id:"minecraft:stone",Count:1b,Slot:0b,tag:{
        simpledrawer:{
            type:"compacting",
            variant:"normal",
            current_material:"none",
            current_material_name:'{"text":"none"}',
            slot_count:1,
            wood_type:"simpledrawer:compacting",
            upgrade:"wood",
            hopper:0b,
            globalCount:0,
            maxCount:256,
            Items:[]
        },
        smithed:{block:{id:"simpledrawer:new_drawer"}}}}
        ]}
    }
}



#Items
#hopper_upgrade
data modify storage simpledrawer:main ItemsNBT.hopper_upgrade set value {id:"minecraft:jigsaw",Count:1b					,tag:{CustomModelData:1430000,ctc:{id:"hopper_upgrade",from:"airdox_:simpledrawer",traits:{"item":1b}},simpledrawer:{upgrade:1b}									,display:{Lore:['{"translate":"simpledrawer.name","color":"blue","italic":true}'],Name:'{"translate":"simpledrawer.hopper_upgrade","color":"white","italic":false}'}}}
#iron_upgrade
data modify storage simpledrawer:main ItemsNBT.iron_upgrade set value {id:"minecraft:jigsaw",Count:1b					,tag:{CustomModelData:1430001,ctc:{id:"iron_upgrade",from:"airdox_:simpledrawer",traits:{"item":1b}},simpledrawer:{upgrade:1b}									,display:{Lore:['{"translate":"simpledrawer.name","color":"blue","italic":true}'],Name:'{"translate":"simpledrawer.iron_upgrade","color":"white","italic":false}'}}}
#gold_upgrade
data modify storage simpledrawer:main ItemsNBT.gold_upgrade set value {id:"minecraft:jigsaw",Count:1b					,tag:{CustomModelData:1430002,ctc:{id:"gold_upgrade",from:"airdox_:simpledrawer",traits:{"item":1b}},simpledrawer:{upgrade:1b}									,display:{Lore:['{"translate":"simpledrawer.name","color":"blue","italic":true}'],Name:'{"translate":"simpledrawer.gold_upgrade","color":"white","italic":false}'}}}
#diamond_upgrade
data modify storage simpledrawer:main ItemsNBT.diamond_upgrade set value {id:"minecraft:jigsaw",Count:1b				,tag:{CustomModelData:1430003,ctc:{id:"diamond_upgrade",from:"airdox_:simpledrawer",traits:{"item":1b}},simpledrawer:{upgrade:1b}									,display:{Lore:['{"translate":"simpledrawer.name","color":"blue","italic":true}'],Name:'{"translate":"simpledrawer.diamond_upgrade","color":"white","italic":false}'}}}
#star_upgrade
data modify storage simpledrawer:main ItemsNBT.star_upgrade set value {id:"minecraft:jigsaw",Count:1b					,tag:{CustomModelData:1430004,ctc:{id:"star_upgrade",from:"airdox_:simpledrawer",traits:{"item":1b}},simpledrawer:{upgrade:1b}									,display:{Lore:['{"translate":"simpledrawer.name","color":"blue","italic":true}'],Name:'{"translate":"simpledrawer.star_upgrade","color":"white","italic":false}'}}}
#netherite_upgrade
data modify storage simpledrawer:main ItemsNBT.netherite_upgrade set value {id:"minecraft:jigsaw",Count:1b				,tag:{CustomModelData:1430005,ctc:{id:"netherite_upgrade",from:"airdox_:simpledrawer",traits:{"item":1b}},simpledrawer:{upgrade:1b}							,display:{Lore:['{"translate":"simpledrawer.name","color":"blue","italic":true}'],Name:'{"translate":"simpledrawer.netherite_upgrade","color":"white","italic":false}'}}}
#downgrade_wrench
data modify storage simpledrawer:main ItemsNBT.downgrade_wrench set value {id:"minecraft:jigsaw",Count:1b				,tag:{CustomModelData:1430006,ctc:{id:"downgrade_wrench",from:"airdox_:simpledrawer",traits:{"item":1b}},simpledrawer:{downgrade:1b}									,display:{Lore:['{"translate":"simpledrawer.name","color":"blue","italic":true}'],Name:'{"translate":"simpledrawer.downgrade_wrench","color":"white","italic":false}'}}}

data modify storage simpledrawer:main ItemsNBT.guide set value {id:"minecraft:written_book",Count:1b,tag:{
    CustomModelData:1430000,
    ctc:{from:"airdox_:simpledrawer",id:"guide",traits:{items:1b}},
    display:{
        Lore:['{"translate":"simpledrawer.name","color":"blue","italic":true}'],
        Name:'{"translate":"simpledrawer.guide","color":"white","italic":false}'},
        },
    title:"SimpleDrawer Guide",
    author:"AirDox_",
    generation:0,
    pages:[]
}

function simpledrawer:impl/guide/generate


function simpledrawer:impl/versioning_items




scoreboard objectives add simpledrawer.math dummy
scoreboard objectives add simpledrawer.id dummy
scoreboard objectives add simpledrawer.drawer.Count dummy
scoreboard objectives add simpledrawer.drawer.maxCount dummy

scoreboard objectives add simpledrawer.new_drawer.id dummy
scoreboard objectives add simpledrawer.new_drawer.part_id dummy
scoreboard objectives add simpledrawer.new_drawer.slot_count dummy

# Versioning block for future updates
scoreboard objectives add simpledrawer.block.major dummy
scoreboard objectives add simpledrawer.block.minor dummy
scoreboard objectives add simpledrawer.block.patch dummy


scoreboard objectives add simpledrawer.io dummy
scoreboard objectives add simpledrawer.player.output_cooldown dummy
scoreboard objectives add simpledrawer.player.input_cooldown dummy
scoreboard objectives add simpledrawer.player.last_id dummy
scoreboard objectives add simpledrawer.nb_click dummy

scoreboard objectives add simpledrawer.config trigger
scoreboard players enable @a simpledrawer.config

scoreboard objectives add simpledrawer.update_guide trigger
scoreboard players enable @a simpledrawer.update_guide

scoreboard objectives add simpledrawer.leave_game minecraft.custom:minecraft.leave_game

scoreboard objectives add simpledrawer.config.output_mode dummy
scoreboard objectives add simpledrawer.config.input_mode dummy

scoreboard players set #9 simpledrawer.math 9
scoreboard players set #81 simpledrawer.math 81
scoreboard players set #10 simpledrawer.math 10
scoreboard players set #100 simpledrawer.math 100
scoreboard players set #1000 simpledrawer.math 1000
scoreboard players set #10000 simpledrawer.math 10000
scoreboard players set #100000 simpledrawer.math 100000
scoreboard players set #1000000 simpledrawer.math 1000000
scoreboard players set #10000000 simpledrawer.math 10000000
scoreboard players set #100000000 simpledrawer.math 100000000
scoreboard players set #1000000000 simpledrawer.math 1000000000


execute unless score #configured simpledrawer.config matches 1 run function simpledrawer:impl/config/load_default


advancement revoke @a only simpledrawer:impl/interact
advancement revoke @a only simpledrawer:impl/attack
advancement revoke @a only simpledrawer:impl/click
advancement revoke @s only simpledrawer:impl/compacting/attack
advancement revoke @s only simpledrawer:impl/compacting/interact


schedule function simpledrawer:impl/tick 1t replace
schedule function simpledrawer:impl/5tick 5t replace
schedule function simpledrawer:impl/20tick 20t replace

function simpledrawer:impl/mc_version_warning