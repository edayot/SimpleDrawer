#execute only at installation
execute unless data storage simpledrawer:temp {Loaded:1b} run function simpledrawer:print_version

scoreboard objectives add SD_tempC dummy
scoreboard objectives add SD_sneak minecraft.custom:minecraft.sneak_time
scoreboard objectives add SD_time dummy


execute unless entity @e[tag=simpledrawer.forceload,type=marker] in simpledrawer:intern run forceload add 0 0
execute unless entity @e[tag=simpledrawer.forceload,type=marker] in simpledrawer:intern run summon marker 0 0 0 {Tags:["simpledrawer.forceload","global.forceload"]}

scoreboard players set 64 SD_tempC 64
scoreboard players set 16 SD_tempC 16
scoreboard players set 1 SD_tempC 1


data modify storage simpledrawer:temp Drawers.wood set value 256L
data modify storage simpledrawer:temp Drawers.iron set value 2048L
data modify storage simpledrawer:temp Drawers.gold set value 8192L
data modify storage simpledrawer:temp Drawers.diamond set value 65536L
data modify storage simpledrawer:temp Drawers.star set value 1048576L
data modify storage simpledrawer:temp Drawers.netherite set value 1073741824L


# Heres is the list of all items NBT

data modify storage simpledrawer:temp ItemsNBT.Upgrades.hopper set value {id:"minecraft:flint",Count:1b,tag:{ctc:{id:"hopper_upgrade",from:"airdox_:simpledrawer",traits:{"item":1b}},display:{Lore:['{"translate":"simpledrawer.name","color":"blue","italic":false}'],Name:'{"translate":"simpledrawer.hopper_upgrade","color":"green","italic":false}'},CustomModelData:1430001,setType:"hopper"}}

data modify storage simpledrawer:temp ItemsNBT.Upgrades.iron set value {id:"minecraft:flint",Count:1b,tag:{ctc:{id:"iron_upgrade",from:"airdox_:simpledrawer",traits:{"item":1b}},display:{Lore:['{"translate":"simpledrawer.name","color":"blue","italic":false}'],Name:'{"translate":"simpledrawer.iron_upgrade","color":"white","italic":false}'},CustomModelData:1430002,setType:"iron"}}
data modify storage simpledrawer:temp ItemsNBT.Upgrades.gold set value {id:"minecraft:flint",Count:1b,tag:{ctc:{id:"gold_upgrade",from:"airdox_:simpledrawer",traits:{"item":1b}},display:{Lore:['{"translate":"simpledrawer.name","color":"blue","italic":false}'],Name:'{"translate":"simpledrawer.gold_upgrade","color":"gold","italic":false}'},CustomModelData:1430003,setType:"gold"}}
data modify storage simpledrawer:temp ItemsNBT.Upgrades.diamond set value {id:"minecraft:flint",Count:1b,tag:{ctc:{id:"diamond_upgrade",from:"airdox_:simpledrawer",traits:{"item":1b}},display:{Lore:['{"translate":"simpledrawer.name","color":"blue","italic":false}'],Name:'{"translate":"simpledrawer.diamond_upgrade","color":"aqua","italic":false}'},CustomModelData:1430004,setType:"diamond"}}
data modify storage simpledrawer:temp ItemsNBT.Upgrades.star set value {id:"minecraft:flint",Count:1b,tag:{ctc:{id:"star_upgrade",from:"airdox_:simpledrawer",traits:{"item":1b}},Enchantments:[{}],display:{Lore:['{"translate":"simpledrawer.name","color":"blue","italic":false}'],Name:'{"translate":"simpledrawer.star_upgrade","color":"dark_grey","italic":false}'},CustomModelData:1430005,setType:"star"}}
data modify storage simpledrawer:temp ItemsNBT.Upgrades.netherite set value {id:"minecraft:flint",Count:1b,tag:{ctc:{id:"netherite_upgrade",from:"airdox_:simpledrawer",traits:{"item":1b}},display:{Lore:['{"translate":"simpledrawer.name","color":"blue","italic":false}'],Name:'{"translate":"simpledrawer.netherite_upgrade","color":"black","italic":false}'},CustomModelData:1430006,setType:"netherite"}}


data modify storage simpledrawer:temp ItemsNBT.wrench set value {id:"minecraft:stick",Count:1b,tag:{ctc:{id:"wrench",from:"airdox_:simpledrawer",traits:{"item":1b,"tool/wrench":1b}},display:{Lore:['{"translate":"simpledrawer.name","color":"blue","italic":false}'],Name:'{"translate":"simpledrawer.downgrade_wrench","color":"white","italic":false}'},CustomModelData:1374,simpledrawer.downgrade:1b}}

data modify storage simpledrawer:temp ItemsNBT.drawer set value {id: "minecraft:furnace", Count: 1b, tag: {ctc:{id:"drawer",from:"airdox_:simpledrawer",traits:{"block":1b}},SD_simpledrawer: 1b, CustomModelData: 1430000L, BlockEntityTag: {Items: [{Slot: 0b, id: "minecraft:dirt", Count: 1b, tag: {Drawer: 1b, info: {type: "wood", hopper: 0, maxCount: 256L}}}], Lock: "SD_DrawerPlacer"}, display: {Lore: ['{"italic":false,"color":"white","extra":[{"italic":false,"color":"dark_gray","text":"/ "},{"italic":false,"color":"white","text":"256L"}],"text":"0 "}', '{"translate":"simpledrawer.name","color":"blue","italic":false}'], Name: '{"translate":"simpledrawer.drawer.empty","italic":false}'}}}




data modify storage simpledrawer:temp Loaded set value 1b




