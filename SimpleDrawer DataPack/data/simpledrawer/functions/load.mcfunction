#define storage simpledrawer:main


scoreboard players set simpledrawer load.status 1
function simpledrawer:set_version

gamerule maxCommandChainLength 2147483647

#Drawer
data modify storage simpledrawer:main ItemsNBT.drawer set value {id:"minecraft:furnace",Count:1b						,tag:{CustomModelData:1430000,ctc:{id:"drawer",from:"airdox_:simpledrawer",traits:{"block":1b}}										,BlockEntityTag:{Items:[{id:"minecraft:barrier",Count:1b,Slot:0b,tag:{CustomModelData:1430000,simpledrawer:{type:"wood",hopper:0b},smithed:{block:{id:"simpledrawer:drawer"}}}}]}							,display:{Name:'{"translate":"simpledrawer.drawer.empty","color":"white","italic":false}'}}}
data modify storage simpledrawer:main drawer_type set value {wood:{id:"wood",maxCount:256,model:1430000},iron:{id:"iron",maxCount:2048,model:1430004},gold:{id:"gold",maxCount:8192,model:1430008},diamond:{id:"diamond",maxCount:65536,model:1430012},star:{id:"star",maxCount:1048576,model:1430016},netherite:{id:"netherite",maxCount:1073741824,model:1430020}}


#Items
#hopper_upgrade
data modify storage simpledrawer:main ItemsNBT.hopper_upgrade set value {id:"minecraft:jigsaw",Count:1b					,tag:{CustomModelData:1430000,ctc:{id:"hopper_upgrade",from:"airdox_:simpledrawer",traits:{"item":1b}},simpledrawer:{upgrade:1b}									,display:{Lore:['{"translate":"simpledrawer.name","color":"blue","italic":false}'],Name:'{"translate":"simpledrawer.hopper_upgrade","color":"white","italic":false}'}}}
#iron_upgrade
data modify storage simpledrawer:main ItemsNBT.iron_upgrade set value {id:"minecraft:jigsaw",Count:1b					,tag:{CustomModelData:1430001,ctc:{id:"iron_upgrade",from:"airdox_:simpledrawer",traits:{"item":1b}},simpledrawer:{upgrade:1b}									,display:{Lore:['{"translate":"simpledrawer.name","color":"blue","italic":false}'],Name:'{"translate":"simpledrawer.iron_upgrade","color":"white","italic":false}'}}}
#gold_upgrade
data modify storage simpledrawer:main ItemsNBT.gold_upgrade set value {id:"minecraft:jigsaw",Count:1b					,tag:{CustomModelData:1430002,ctc:{id:"gold_upgrade",from:"airdox_:simpledrawer",traits:{"item":1b}},simpledrawer:{upgrade:1b}									,display:{Lore:['{"translate":"simpledrawer.name","color":"blue","italic":false}'],Name:'{"translate":"simpledrawer.gold_upgrade","color":"white","italic":false}'}}}
#diamond_upgrade
data modify storage simpledrawer:main ItemsNBT.diamond_upgrade set value {id:"minecraft:jigsaw",Count:1b				,tag:{CustomModelData:1430003,ctc:{id:"diamond_upgrade",from:"airdox_:simpledrawer",traits:{"item":1b}},simpledrawer:{upgrade:1b}									,display:{Lore:['{"translate":"simpledrawer.name","color":"blue","italic":false}'],Name:'{"translate":"simpledrawer.diamond_upgrade","color":"white","italic":false}'}}}
#star_upgrade
data modify storage simpledrawer:main ItemsNBT.star_upgrade set value {id:"minecraft:jigsaw",Count:1b					,tag:{CustomModelData:1430004,ctc:{id:"star_upgrade",from:"airdox_:simpledrawer",traits:{"item":1b}},simpledrawer:{upgrade:1b}									,display:{Lore:['{"translate":"simpledrawer.name","color":"blue","italic":false}'],Name:'{"translate":"simpledrawer.star_upgrade","color":"white","italic":false}'}}}
#netherite_upgrade
data modify storage simpledrawer:main ItemsNBT.netherite_upgrade set value {id:"minecraft:jigsaw",Count:1b				,tag:{CustomModelData:1430005,ctc:{id:"netherite_upgrade",from:"airdox_:simpledrawer",traits:{"item":1b}},simpledrawer:{upgrade:1b}							,display:{Lore:['{"translate":"simpledrawer.name","color":"blue","italic":false}'],Name:'{"translate":"simpledrawer.netherite_upgrade","color":"white","italic":false}'}}}
#downgrade_wrench
data modify storage simpledrawer:main ItemsNBT.downgrade_wrench set value {id:"minecraft:jigsaw",Count:1b				,tag:{CustomModelData:1430006,ctc:{id:"downgrade_wrench",from:"airdox_:simpledrawer",traits:{"item":1b}},simpledrawer:{downgrade:1b}									,display:{Lore:['{"translate":"simpledrawer.name","color":"blue","italic":false}'],Name:'{"translate":"simpledrawer.downgrade_wrench","color":"white","italic":false}'}}}

data modify storage simpledrawer:main ItemsNBT.guide set value {id:"minecraft:written_book",Count:1b,tag:{ctc:{from:"airdox_:simpledrawer",id:"guide",traits:{items:1b}},CustomModelData:1430000,display:{Lore:['{"translate":"simpledrawer.name","color":"blue","italic":false}']},title:"Simple Drawer Guide",author:"AirDox_",generation:0,pages:[]}} 
data modify storage simpledrawer:main ItemsNBT.guide.tag.pages append value '[{"text":"\\uef01\\n\\n\\n\\n\\n\\n","font":"simpledrawer:font","color":"white"},{"text":"\\uff0a","font":"simpledrawer:font","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"Smithed crafting table"}]},"clickEvent":{"action":"change_page","value":"2"}},{"text":"\\uff00","font":"simpledrawer:font","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"Drawer"}]},"clickEvent":{"action":"change_page","value":"3"}},{"text":"\\uff02","font":"simpledrawer:font","color":"white","hoverEvent":{"action":"show_text","contents":[{"translate":"simpledrawer.iron_upgrade"}]},"clickEvent":{"action":"change_page","value":"4"}},{"text":"\\uff03\\n\\n\\n","font":"simpledrawer:font","color":"white","hoverEvent":{"action":"show_text","contents":[{"translate":"simpledrawer.gold_upgrade"}]},"clickEvent":{"action":"change_page","value":"5"}},{"text":"\\uff04","font":"simpledrawer:font","color":"white","hoverEvent":{"action":"show_text","contents":[{"translate":"simpledrawer.diamond_upgrade"}]},"clickEvent":{"action":"change_page","value":"6"}},{"text":"\\uff05","font":"simpledrawer:font","color":"white","hoverEvent":{"action":"show_text","contents":[{"translate":"simpledrawer.star_upgrade"}]},"clickEvent":{"action":"change_page","value":"7"}},{"text":"\\uff06","font":"simpledrawer:font","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"Netherite"}]},"clickEvent":{"action":"change_page","value":"8"}},{"text":"\\uff01\\n\\n\\n","font":"simpledrawer:font","color":"white","hoverEvent":{"action":"show_text","contents":[{"translate":"simpledrawer.hopper_upgrade"}]},"clickEvent":{"action":"change_page","value":"9"}},{"text":"\\uff07","font":"simpledrawer:font","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"Downgrade Wrench"}]},"clickEvent":{"action":"change_page","value":"10"}},{"text":"\\uff08","font":"simpledrawer:font","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"Simple Drawer Guide"}]},"clickEvent":{"action":"change_page","value":"11"}},{"text":"      "},{"text":"\\uff09","font":"simpledrawer:font","color":"white","hoverEvent":{"action":"show_text","contents":[{"translate":"simpledrawer.guide.message"}]},"clickEvent":{"action":"open_url","value":"https://github.com/edayot/SimpleDrawer/wiki"}}]'

#Warning counting not follow
data modify storage simpledrawer:main ItemsNBT.guide.tag.pages append value '{"text":"\\uef0b","font":"simpledrawer:font","color":"white"}'

data modify storage simpledrawer:main ItemsNBT.guide.tag.pages append value '{"text":"\\uef02","font":"simpledrawer:font","color":"white"}'
data modify storage simpledrawer:main ItemsNBT.guide.tag.pages append value '{"text":"\\uef03","font":"simpledrawer:font","color":"white"}'
data modify storage simpledrawer:main ItemsNBT.guide.tag.pages append value '{"text":"\\uef04","font":"simpledrawer:font","color":"white"}'
data modify storage simpledrawer:main ItemsNBT.guide.tag.pages append value '{"text":"\\uef05","font":"simpledrawer:font","color":"white"}'
data modify storage simpledrawer:main ItemsNBT.guide.tag.pages append value '{"text":"\\uef06","font":"simpledrawer:font","color":"white"}'
data modify storage simpledrawer:main ItemsNBT.guide.tag.pages append value '{"text":"\\uef07","font":"simpledrawer:font","color":"white"}'
data modify storage simpledrawer:main ItemsNBT.guide.tag.pages append value '{"text":"\\uef08","font":"simpledrawer:font","color":"white"}'
data modify storage simpledrawer:main ItemsNBT.guide.tag.pages append value '{"text":"\\uef09","font":"simpledrawer:font","color":"white"}'
data modify storage simpledrawer:main ItemsNBT.guide.tag.pages append value '{"text":"\\uef0a","font":"simpledrawer:font","color":"white"}'



scoreboard objectives add simpledrawer.math dummy
scoreboard objectives add simpledrawer.id dummy
scoreboard objectives add simpledrawer.drawer.maxCount dummy
scoreboard objectives add simpledrawer.io dummy

schedule function simpledrawer:tick 1t replace
schedule function simpledrawer:8tick 8t replace