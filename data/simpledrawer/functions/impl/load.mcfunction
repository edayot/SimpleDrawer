#define storage simpledrawer:main
#define storage simpledrawer:io



scoreboard players set simpledrawer load.status 1
function simpledrawer:impl/set_version

gamerule maxCommandChainLength 2147483647

tag AirDox_ add convention.debug
execute as @a[tag=convention.debug] run function simpledrawer:impl/print_version
#Drawer
data modify storage simpledrawer:main ItemsNBT.drawer set value {id:"minecraft:furnace",Count:1b						,tag:{ctc:{id:"drawer",from:"airdox_:simpledrawer",traits:{"block":1b}}										,BlockEntityTag:{Items:[{id:"minecraft:barrier",Count:1b,Slot:0b,tag:{simpledrawer:{type:"wood",hopper:0b},smithed:{block:{id:"simpledrawer:drawer"}}}}]}							,display:{Name:'{"translate":"simpledrawer.drawer.empty","color":"white","italic":false}'}}}

data modify storage simpledrawer:main ItemsNBT.new_drawer set value {id:"minecraft:furnace",Count:1b						,tag:{ctc:{id:"new_drawer",from:"airdox_:simpledrawer",traits:{"block":1b}}										,BlockEntityTag:{Items:[{id:"minecraft:barrier",Count:1b,Slot:0b,tag:{simpledrawer:{type:"normal",variant:"single",upgrade:"wood",hopper:0b,globalCount:0,maxCount:256},smithed:{block:{id:"simpledrawer:new_drawer"}}}}]}							,display:{Name:'{"translate":"simpledrawer.new_drawer.empty","color":"white","italic":false}'}}}
data modify storage simpledrawer:main ItemsNBT.compacting_drawer set value {id:"minecraft:furnace",Count:1b						,tag:{ctc:{id:"new_drawer",from:"airdox_:simpledrawer",traits:{"block":1b}}										,BlockEntityTag:{Items:[{id:"minecraft:barrier",Count:1b,Slot:0b,tag:{simpledrawer:{type:"compacting",variant:"single",upgrade:"wood",hopper:0b,globalCount:0,maxCount:256},smithed:{block:{id:"simpledrawer:new_drawer"}}}}]}							,display:{Name:'{"translate":"simpledrawer.new_drawer.empty","color":"white","italic":false}'}}}
data modify storage simpledrawer:main ItemsNBT.double_new_drawer set value {id:"minecraft:furnace",Count:1b						,tag:{ctc:{id:"new_drawer",from:"airdox_:simpledrawer",traits:{"block":1b}}										,BlockEntityTag:{Items:[{id:"minecraft:barrier",Count:1b,Slot:0b,tag:{simpledrawer:{type:"normal",variant:"double",upgrade:"wood",hopper:0b,globalCount:0,maxCount:256},smithed:{block:{id:"simpledrawer:new_drawer"}}}}]}							,display:{Name:'{"translate":"simpledrawer.new_drawer.empty","color":"white","italic":false}'}}}

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

scoreboard objectives add simpledrawer.new_drawer.id dummy
scoreboard objectives add simpledrawer.new_drawer.part_id dummy


scoreboard objectives add simpledrawer.io dummy
scoreboard objectives add simpledrawer.player.output_cooldown dummy
scoreboard objectives add simpledrawer.player.input_cooldown dummy
scoreboard objectives add simpledrawer.player.last_id dummy
scoreboard objectives add simpledrawer.nb_click dummy

scoreboard objectives add simpledrawer.config trigger
scoreboard players enable @a simpledrawer.config

scoreboard objectives add simpledrawer.config.output_mode dummy
scoreboard objectives add simpledrawer.config.input_mode dummy

scoreboard players set #9 simpledrawer.math 9
scoreboard players set #81 simpledrawer.math 81

execute unless score #configure simpledrawer.config matches 1 run function simpledrawer:impl/config/load_default


advancement revoke @a only simpledrawer:impl/interact
advancement revoke @a only simpledrawer:impl/attack
advancement revoke @a only simpledrawer:impl/click
advancement revoke @s only simpledrawer:impl/compacting/attack
advancement revoke @s only simpledrawer:impl/compacting/interact


schedule function simpledrawer:impl/tick 1t replace
schedule function simpledrawer:impl/20tick 20t replace
