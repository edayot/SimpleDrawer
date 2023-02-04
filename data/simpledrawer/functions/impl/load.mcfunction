#define storage simpledrawer:main
#define storage simpledrawer:io



scoreboard players set simpledrawer load.status 1
function simpledrawer:impl/set_version

gamerule maxCommandChainLength 2147483647

tag AirDox_ add convention.debug
execute as @a[tag=convention.debug] run function simpledrawer:impl/print_version
#Drawer
data modify storage simpledrawer:main ItemsNBT.drawer set value {id:"minecraft:furnace",Count:1b						,tag:{ctc:{id:"drawer",from:"airdox_:simpledrawer",traits:{"block":1b}}										,BlockEntityTag:{Items:[{id:"minecraft:barrier",Count:1b,Slot:0b,tag:{simpledrawer:{type:"wood",hopper:0b},smithed:{block:{id:"simpledrawer:drawer"}}}}]}							,display:{Name:'{"translate":"simpledrawer.drawer.empty","color":"white","italic":false}'}}}

data modify storage simpledrawer:main ItemsNBT.new_drawer set value {id:"minecraft:furnace",Count:1b						,tag:{ctc:{id:"new_drawer",from:"airdox_:simpledrawer",traits:{"block":1b}}										,BlockEntityTag:{Items:[{id:"minecraft:beehive",Count:1b,Slot:0b,tag:{simpledrawer:{variant:"classic",nb_enabled:1b,type:"wood",hopper:0b,interact:[{type:0,slot:0},{type:0,slot:0},{type:1,slot:0},{type:0,slot:0},{type:0,slot:0},{type:1,slot:0}],Item0:{Count:0b},Item1:{Count:0b},Item2:{Count:0b},Item3:{Count:0b},Item4:{Count:0b},Item5:{Count:0b}},smithed:{block:{id:"simpledrawer:new_drawer"}}}}]}							,display:{Name:'{"translate":"simpledrawer.drawer.empty","color":"white","italic":false}'}}}

data modify storage simpledrawer:main ItemsNBT.double_new_drawer set from storage simpledrawer:main ItemsNBT.new_drawer
data modify storage simpledrawer:main ItemsNBT.double_new_drawer.tag.BlockEntityTag.Items[0].tag.simpledrawer.variant set value "double"
data modify storage simpledrawer:main ItemsNBT.double_new_drawer.tag.BlockEntityTag.Items[0].tag.simpledrawer.nb_enabled set value 2
data modify storage simpledrawer:main ItemsNBT.double_new_drawer.tag.BlockEntityTag.Items[0].tag.simpledrawer.interact set value [{type:0,slot:0},{type:0,slot:0},{type:1,slot:0},{type:0,slot:1},{type:0,slot:1},{type:1,slot:1}]

data modify storage simpledrawer:main ItemsNBT.triple_new_drawer set from storage simpledrawer:main ItemsNBT.new_drawer
data modify storage simpledrawer:main ItemsNBT.triple_new_drawer.tag.BlockEntityTag.Items[0].tag.simpledrawer.variant set value "triple"
data modify storage simpledrawer:main ItemsNBT.triple_new_drawer.tag.BlockEntityTag.Items[0].tag.simpledrawer.nb_enabled set value 3
data modify storage simpledrawer:main ItemsNBT.triple_new_drawer.tag.BlockEntityTag.Items[0].tag.simpledrawer.interact set value [{type:0,slot:0},{type:0,slot:1},{type:0,slot:2},{type:1,slot:0},{type:1,slot:1},{type:1,slot:2}]


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

data modify storage simpledrawer:main ItemsNBT.guide set value {id:"minecraft:written_book",Count:1b,tag:{ctc:{from:"airdox_:simpledrawer",id:"guide",traits:{items:1b}},CustomModelData:1430000,display:{Lore:['{"translate":"simpledrawer.name","color":"blue","italic":true}']},title:"SimpleDrawer Guide",author:"AirDox_",generation:0,pages:[]}} 
data modify storage simpledrawer:main ItemsNBT.guide.tag.pages append value '[{"text":"\\uef01\\n\\n\\n\\n\\n\\n","font":"simpledrawer:font","color":"white"},{"text":"\\uff0a","font":"simpledrawer:font","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"Heavy Workbench"}]},"clickEvent":{"action":"change_page","value":"2"}},{"text":"\\uff00","font":"simpledrawer:font","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"Drawer"}]},"clickEvent":{"action":"change_page","value":"3"}},{"text":"\\uff02","font":"simpledrawer:font","color":"white","hoverEvent":{"action":"show_text","contents":[{"translate":"simpledrawer.iron_upgrade"}]},"clickEvent":{"action":"change_page","value":"4"}},{"text":"\\uff03\\n\\n\\n","font":"simpledrawer:font","color":"white","hoverEvent":{"action":"show_text","contents":[{"translate":"simpledrawer.gold_upgrade"}]},"clickEvent":{"action":"change_page","value":"5"}},{"text":"\\uff04","font":"simpledrawer:font","color":"white","hoverEvent":{"action":"show_text","contents":[{"translate":"simpledrawer.diamond_upgrade"}]},"clickEvent":{"action":"change_page","value":"6"}},{"text":"\\uff05","font":"simpledrawer:font","color":"white","hoverEvent":{"action":"show_text","contents":[{"translate":"simpledrawer.star_upgrade"}]},"clickEvent":{"action":"change_page","value":"7"}},{"text":"\\uff06","font":"simpledrawer:font","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"Netherite"}]},"clickEvent":{"action":"change_page","value":"8"}},{"text":"\\uff01\\n\\n\\n","font":"simpledrawer:font","color":"white","hoverEvent":{"action":"show_text","contents":[{"translate":"simpledrawer.hopper_upgrade"}]},"clickEvent":{"action":"change_page","value":"9"}},{"text":"\\uff07","font":"simpledrawer:font","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"Downgrade Wrench"}]},"clickEvent":{"action":"change_page","value":"10"}},{"text":"\\uff08","font":"simpledrawer:font","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"SimpleDrawer Guide"}]},"clickEvent":{"action":"change_page","value":"11"}},{"text":"      "},{"text":"\\uff09","font":"simpledrawer:font","color":"white","hoverEvent":{"action":"show_text","contents":[{"translate":"simpledrawer.guide.message"}]},"clickEvent":{"action":"open_url","value":"https://github.com/edayot/SimpleDrawer/wiki"}}]'

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

data modify storage simpledrawer:main ItemsNBT.guide2 set value {id:"minecraft:written_book",Count:1b,tag:{ctc:{from:"airdox_:simpledrawer",id:"guide",traits:{items:1b}},CustomModelData:1430000,display:{Lore:['{"translate":"simpledrawer.name","color":"blue","italic":true}']},title:"SimpleDrawer Guide",author:"AirDox_",generation:0,pages:[]}} 

data modify storage simpledrawer:main ItemsNBT.guide2.tag.pages append value '{"text":"yolor","hoverEvent":{"action":"show_item","contents":{"id":"minecraft:stone","count":1}}}'


scoreboard objectives add simpledrawer.math dummy
scoreboard objectives add simpledrawer.id dummy
scoreboard objectives add simpledrawer.drawer.Count dummy
scoreboard objectives add simpledrawer.drawer.maxCount dummy

#New drawer
scoreboard objectives add simpledrawer.drawer.nb_enabled dummy

scoreboard objectives add simpledrawer.drawer.Count0 dummy
scoreboard objectives add simpledrawer.drawer.maxCount0 dummy

scoreboard objectives add simpledrawer.drawer.Count1 dummy
scoreboard objectives add simpledrawer.drawer.maxCount1 dummy

scoreboard objectives add simpledrawer.drawer.Count2 dummy
scoreboard objectives add simpledrawer.drawer.maxCount2 dummy

scoreboard objectives add simpledrawer.drawer.Count3 dummy
scoreboard objectives add simpledrawer.drawer.maxCount3 dummy

scoreboard objectives add simpledrawer.drawer.Count4 dummy
scoreboard objectives add simpledrawer.drawer.maxCount4 dummy

scoreboard objectives add simpledrawer.drawer.Count5 dummy
scoreboard objectives add simpledrawer.drawer.maxCount5 dummy

scoreboard objectives add simpledrawer.io dummy
scoreboard objectives add simpledrawer.player.output_cooldown dummy
scoreboard objectives add simpledrawer.player.input_cooldown dummy
scoreboard objectives add simpledrawer.player.last_id dummy
scoreboard objectives add simpledrawer.nb_click dummy

scoreboard objectives add simpledrawer.config trigger
scoreboard players enable @a simpledrawer.config

scoreboard objectives add simpledrawer.config.output_mode dummy
scoreboard objectives add simpledrawer.config.input_mode dummy

execute unless score #configure simpledrawer.config matches 1 run function simpledrawer:impl/config/load_default



schedule function simpledrawer:impl/tick 1t replace
