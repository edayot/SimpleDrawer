#define storage simpledrawer:temp


scoreboard players set simpledrawer load.status 1
function simpledrawer:set_version

gamerule maxCommandChainLength 2147483647

#execute only at installation


scoreboard objectives add simpledrawer.tempC dummy
scoreboard objectives add simpledrawer.sneak minecraft.custom:minecraft.sneak_time
scoreboard objectives add simpledrawer.time dummy


execute in simpledrawer:intern run forceload add 0 0
execute in simpledrawer:intern unless entity @e[tag=simpledrawer.forceload,type=marker,distance=0..] run summon marker 0 0 0 {Tags:["simpledrawer.forceload","global.forceload"]}

scoreboard players set 64 simpledrawer.tempC 64
scoreboard players set 16 simpledrawer.tempC 16
scoreboard players set 1 simpledrawer.tempC 1
scoreboard players set 4 simpledrawer.tempC 4


data modify storage simpledrawer:temp Drawers.wood set value 256L
data modify storage simpledrawer:temp Drawers.iron set value 2048L
data modify storage simpledrawer:temp Drawers.gold set value 8192L
data modify storage simpledrawer:temp Drawers.diamond set value 65536L
data modify storage simpledrawer:temp Drawers.star set value 1048576L
data modify storage simpledrawer:temp Drawers.netherite set value 1073741824L


# Heres is the list of all items NBT

data modify storage simpledrawer:temp ItemsNBT.Upgrades.hopper set value {id:"minecraft:flint",Count:1b,tag:{ctc:{id:"hopper_upgrade",from:"airdox_:simpledrawer",traits:{"item":1b}},display:{Lore:['{"translate":"simpledrawer.name","color":"blue","italic":false}'],Name:'{"translate":"simpledrawer.hopper_upgrade","color":"green","italic":false}'},CustomModelData:1430001}}

data modify storage simpledrawer:temp ItemsNBT.Upgrades.iron set value {id:"minecraft:flint",Count:1b,tag:{ctc:{id:"iron_upgrade",from:"airdox_:simpledrawer",traits:{"item":1b}},display:{Lore:['{"translate":"simpledrawer.name","color":"blue","italic":false}'],Name:'{"translate":"simpledrawer.iron_upgrade","color":"white","italic":false}'},CustomModelData:1430002}}
data modify storage simpledrawer:temp ItemsNBT.Upgrades.gold set value {id:"minecraft:flint",Count:1b,tag:{ctc:{id:"gold_upgrade",from:"airdox_:simpledrawer",traits:{"item":1b}},display:{Lore:['{"translate":"simpledrawer.name","color":"blue","italic":false}'],Name:'{"translate":"simpledrawer.gold_upgrade","color":"gold","italic":false}'},CustomModelData:1430003}}
data modify storage simpledrawer:temp ItemsNBT.Upgrades.diamond set value {id:"minecraft:flint",Count:1b,tag:{ctc:{id:"diamond_upgrade",from:"airdox_:simpledrawer",traits:{"item":1b}},display:{Lore:['{"translate":"simpledrawer.name","color":"blue","italic":false}'],Name:'{"translate":"simpledrawer.diamond_upgrade","color":"aqua","italic":false}'},CustomModelData:1430004}}
data modify storage simpledrawer:temp ItemsNBT.Upgrades.star set value {id:"minecraft:flint",Count:1b,tag:{ctc:{id:"star_upgrade",from:"airdox_:simpledrawer",traits:{"item":1b}},Enchantments:[{}],display:{Lore:['{"translate":"simpledrawer.name","color":"blue","italic":false}'],Name:'{"translate":"simpledrawer.star_upgrade","color":"dark_grey","italic":false}'},CustomModelData:1430005}}
data modify storage simpledrawer:temp ItemsNBT.Upgrades.netherite set value {id:"minecraft:flint",Count:1b,tag:{ctc:{id:"netherite_upgrade",from:"airdox_:simpledrawer",traits:{"item":1b}},display:{Lore:['{"translate":"simpledrawer.name","color":"blue","italic":false}'],Name:'{"translate":"simpledrawer.netherite_upgrade","color":"black","italic":false}'},CustomModelData:1430006}}


data modify storage simpledrawer:temp ItemsNBT.wrench set value {id:"minecraft:stick",Count:1b,tag:{ctc:{id:"wrench",from:"airdox_:simpledrawer",traits:{"item":1b,"tool/wrench":1b}},display:{Lore:['{"translate":"simpledrawer.name","color":"blue","italic":false}'],Name:'{"translate":"simpledrawer.downgrade_wrench","color":"white","italic":false}'},CustomModelData:1430000}}

data modify storage simpledrawer:temp ItemsNBT.drawer set value {id: "minecraft:furnace", Count: 1b, tag: {ctc:{id:"drawer",from:"airdox_:simpledrawer",traits:{"block":1b}}, CustomModelData: 1430000L, BlockEntityTag: {Items: [{Slot: 0b, id: "minecraft:dirt", Count: 1b, tag: {Drawer: 1b, info: {type: "wood", hopper: 0, maxCount: 256L}}}], Lock: "simpledrawer.DrawerPlacer"}, display: {Lore: ['{"italic":false,"color":"white","extra":[{"italic":false,"color":"dark_gray","text":"/ "},{"italic":false,"color":"white","text":"256L"}],"text":"0 "}', '{"translate":"simpledrawer.name","color":"blue","italic":false}'], Name: '{"translate":"simpledrawer.drawer.empty","italic":false}'}}}


#Guide construction
data modify storage simpledrawer:temp ItemsNBT.guide set value {id:"minecraft:written_book",Count:1b,tag:{ctc:{from:"airdox_:simpledrawer",id:"guide",traits:{items:1b}},CustomModelData:1430000,display:{Lore:['{"translate":"simpledrawer.name","color":"blue","italic":false}']},title:"Simple Drawer Guide",author:"AirDox_",generation:0,pages:[]}} 
data modify storage simpledrawer:temp ItemsNBT.guide.tag.pages append value '[{"text":"\\uef01\\n\\n\\n\\n\\n\\n","font":"simpledrawer:font","color":"white"},{"text":"\\uff0a","font":"simpledrawer:font","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"Smithed crafting table"}]},"clickEvent":{"action":"change_page","value":"2"}},{"text":"\\uff00","font":"simpledrawer:font","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"Drawer"}]},"clickEvent":{"action":"change_page","value":"3"}},{"text":"\\uff02","font":"simpledrawer:font","color":"white","hoverEvent":{"action":"show_text","contents":[{"translate":"simpledrawer.iron_upgrade"}]},"clickEvent":{"action":"change_page","value":"4"}},{"text":"\\uff03\\n\\n\\n","font":"simpledrawer:font","color":"white","hoverEvent":{"action":"show_text","contents":[{"translate":"simpledrawer.gold_upgrade"}]},"clickEvent":{"action":"change_page","value":"5"}},{"text":"\\uff04","font":"simpledrawer:font","color":"white","hoverEvent":{"action":"show_text","contents":[{"translate":"simpledrawer.diamond_upgrade"}]},"clickEvent":{"action":"change_page","value":"6"}},{"text":"\\uff05","font":"simpledrawer:font","color":"white","hoverEvent":{"action":"show_text","contents":[{"translate":"simpledrawer.star_upgrade"}]},"clickEvent":{"action":"change_page","value":"7"}},{"text":"\\uff06","font":"simpledrawer:font","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"Netherite"}]},"clickEvent":{"action":"change_page","value":"8"}},{"text":"\\uff01\\n\\n\\n","font":"simpledrawer:font","color":"white","hoverEvent":{"action":"show_text","contents":[{"translate":"simpledrawer.hopper_upgrade"}]},"clickEvent":{"action":"change_page","value":"9"}},{"text":"\\uff07","font":"simpledrawer:font","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"Downgrade Wrench"}]},"clickEvent":{"action":"change_page","value":"10"}},{"text":"\\uff08","font":"simpledrawer:font","color":"white","hoverEvent":{"action":"show_text","contents":[{"text":"Simple Drawer Guide"}]},"clickEvent":{"action":"change_page","value":"11"}},{"text":"      "},{"text":"\\uff09","font":"simpledrawer:font","color":"white","hoverEvent":{"action":"show_text","contents":[{"translate":"simpledrawer.guide.message"}]},"clickEvent":{"action":"open_url","value":"https://github.com/edayot/SimpleDrawer/wiki"}}]'

#Warning counting not follow
data modify storage simpledrawer:temp ItemsNBT.guide.tag.pages append value '{"text":"\\uef0b","font":"simpledrawer:font","color":"white"}'

data modify storage simpledrawer:temp ItemsNBT.guide.tag.pages append value '{"text":"\\uef02","font":"simpledrawer:font","color":"white"}'
data modify storage simpledrawer:temp ItemsNBT.guide.tag.pages append value '{"text":"\\uef03","font":"simpledrawer:font","color":"white"}'
data modify storage simpledrawer:temp ItemsNBT.guide.tag.pages append value '{"text":"\\uef04","font":"simpledrawer:font","color":"white"}'
data modify storage simpledrawer:temp ItemsNBT.guide.tag.pages append value '{"text":"\\uef05","font":"simpledrawer:font","color":"white"}'
data modify storage simpledrawer:temp ItemsNBT.guide.tag.pages append value '{"text":"\\uef06","font":"simpledrawer:font","color":"white"}'
data modify storage simpledrawer:temp ItemsNBT.guide.tag.pages append value '{"text":"\\uef07","font":"simpledrawer:font","color":"white"}'
data modify storage simpledrawer:temp ItemsNBT.guide.tag.pages append value '{"text":"\\uef08","font":"simpledrawer:font","color":"white"}'
data modify storage simpledrawer:temp ItemsNBT.guide.tag.pages append value '{"text":"\\uef09","font":"simpledrawer:font","color":"white"}'
data modify storage simpledrawer:temp ItemsNBT.guide.tag.pages append value '{"text":"\\uef0a","font":"simpledrawer:font","color":"white"}'

data modify storage simpledrawer:temp Loaded set value 1b


schedule function simpledrawer:tick 1t

