#define storage simpledrawer:main


scoreboard players set simpledrawer load.status 1
function simpledrawer:set_version

gamerule maxCommandChainLength 2147483647

#Drawer
data modify storage simpledrawer:main ItemsNBT.drawer set value {id:"minecraft:furnace",Count:1b					,tag:{CustomModelData:1430000,ctc:{id:"drawer",from:"airdox_:simpledrawer",traits:{"block":1b}}										,BlockEntityTag:{Items:[{id:"minecraft:barrier",Count:1b,Slot:0b,tag:{simpledrawer:{type:"wood",hopper:0b},smithed:{block:{id:"simpledrawer:drawer"}}}}]}							,display:{Lore:['{"translate":"simpledrawer.name","color":"blue","italic":false}'],Name:'{"translate":"simpledrawer.drawer.empty","color":"white","italic":false}'}}}


scoreboard objectives add simpledrawer.math dummy
scoreboard objectives add simpledrawer.id dummy
scoreboard objectives add simpledrawer.drawer.maxCount dummy
scoreboard objectives add simpledrawer.io dummy

schedule function simpledrawer:tick 1t replace