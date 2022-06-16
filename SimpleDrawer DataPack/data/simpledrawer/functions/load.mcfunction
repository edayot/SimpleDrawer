#define storage simpledrawer:main


scoreboard players set simpledrawer load.status 1
function simpledrawer:set_version

gamerule maxCommandChainLength 2147483647

#Drawer
data modify storage simpledrawer:main ItemsNBT.drawer set value {id:"minecraft:furnace",Count:1b						,tag:{CustomModelData:1430000,ctc:{id:"drawer",from:"airdox_:simpledrawer",traits:{"block":1b}}										,BlockEntityTag:{Items:[{id:"minecraft:barrier",Count:1b,Slot:0b,tag:{simpledrawer:{type:"wood",hopper:0b},smithed:{block:{id:"simpledrawer:drawer"}}}}]}							,display:{Name:'{"translate":"simpledrawer.drawer.empty","color":"white","italic":false}'}}}
data modify storage simpledrawer:main drawer_type set value {wood:{id:"wood",maxCount:256,model:1430000},iron:{id:"iron",maxCount:2048,model:1430004},gold:{id:"gold",maxCount:8192,model:1430008},diamond:{id:"diamond",maxCount:65536,model:1430012},star:{id:"star",maxCount:1048576,model:1430016},netherite:{id:"netherite",maxCount:1073741824,model:1430020}}


#Items
#hopper_upgrade
data modify storage simpledrawer:main ItemsNBT.hopper_upgrade set value {id:"minecraft:jigsaw",Count:1b					,tag:{CustomModelData:1430000,ctc:{id:"hopper_upgrade",from:"airdox_:simpledrawer",traits:{"item":1b}}									,display:{Lore:['{"translate":"simpledrawer.name","color":"blue","italic":false}'],Name:'{"translate":"simpledrawer.hopper_upgrade","color":"white","italic":false}'}}}
#iron_upgrade
data modify storage simpledrawer:main ItemsNBT.iron_upgrade set value {id:"minecraft:jigsaw",Count:1b					,tag:{CustomModelData:1430001,ctc:{id:"iron_upgrade",from:"airdox_:simpledrawer",traits:{"item":1b}}									,display:{Lore:['{"translate":"simpledrawer.name","color":"blue","italic":false}'],Name:'{"translate":"simpledrawer.iron_upgrade","color":"white","italic":false}'}}}
#gold_upgrade
data modify storage simpledrawer:main ItemsNBT.gold_upgrade set value {id:"minecraft:jigsaw",Count:1b					,tag:{CustomModelData:1430002,ctc:{id:"gold_upgrade",from:"airdox_:simpledrawer",traits:{"item":1b}}									,display:{Lore:['{"translate":"simpledrawer.name","color":"blue","italic":false}'],Name:'{"translate":"simpledrawer.gold_upgrade","color":"white","italic":false}'}}}
#diamond_upgrade
data modify storage simpledrawer:main ItemsNBT.diamond_upgrade set value {id:"minecraft:jigsaw",Count:1b				,tag:{CustomModelData:1430003,ctc:{id:"diamond_upgrade",from:"airdox_:simpledrawer",traits:{"item":1b}}									,display:{Lore:['{"translate":"simpledrawer.name","color":"blue","italic":false}'],Name:'{"translate":"simpledrawer.diamond_upgrade","color":"white","italic":false}'}}}
#star_upgrade
data modify storage simpledrawer:main ItemsNBT.star_upgrade set value {id:"minecraft:jigsaw",Count:1b					,tag:{CustomModelData:1430004,ctc:{id:"star_upgrade",from:"airdox_:simpledrawer",traits:{"item":1b}}									,display:{Lore:['{"translate":"simpledrawer.name","color":"blue","italic":false}'],Name:'{"translate":"simpledrawer.star_upgrade","color":"white","italic":false}'}}}
#netherite_upgrade
data modify storage simpledrawer:main ItemsNBT.netherite_upgrade set value {id:"minecraft:jigsaw",Count:1b				,tag:{CustomModelData:1430005,ctc:{id:"netherite_upgrade",from:"airdox_:simpledrawer",traits:{"item":1b}}								,display:{Lore:['{"translate":"simpledrawer.name","color":"blue","italic":false}'],Name:'{"translate":"simpledrawer.netherite_upgrade","color":"white","italic":false}'}}}



scoreboard objectives add simpledrawer.math dummy
scoreboard objectives add simpledrawer.id dummy
scoreboard objectives add simpledrawer.drawer.maxCount dummy
scoreboard objectives add simpledrawer.io dummy

schedule function simpledrawer:tick 1t replace
schedule function simpledrawer:8tick 8t replace