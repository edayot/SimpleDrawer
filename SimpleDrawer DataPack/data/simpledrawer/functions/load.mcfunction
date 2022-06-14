#define storage simpledrawer:main


scoreboard players set simpledrawer load.status 1
function simpledrawer:set_version

gamerule maxCommandChainLength 2147483647

#Drawer
data modify storage simpledrawer:main ItemsNBT.drawer set value {id:"minecraft:furnace",Count:1b					,tag:{CustomModelData:1430000L,ctc:{id:"drawer",from:"airdox_:simpledrawer",traits:{"block":1b}}										,BlockEntityTag:{Items:[{id:"minecraft:barrier",Count:1b,Slot:0b,tag:{simpledrawer:{type:"wood",hopper:0b},smithed:{block:{id:"simpledrawer:drawer"}}}}]}							,display:{Lore: ['{"italic":false,"color":"white","extra":[{"italic":false,"color":"gray","text":" / "},{"italic":false,"color":"white","text":"256"}],"text":"0"}', '{"italic":false,"color":"blue","translate":"simpledrawer.name"}'],Name:'{"translate":"simpledrawer.drawer.empty","color":"white","italic":false}'}}}


scoreboard objectives add simpledrawer.math dummy
scoreboard objectives add simpledrawer.id dummy
scoreboard objectives add simpledrawer.drawer.maxCount dummy
scoreboard objectives add simpledrawer.io dummy

schedule function simpledrawer:tick 1t replace