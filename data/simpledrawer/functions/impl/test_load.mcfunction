


scoreboard players set #simpledrawer.smithed.custom_block load.status 0
scoreboard players set #simpledrawer.itemio load.status 0
scoreboard players set #simpledrawer.smithed.crafter load.status 0
#smithed.crafter.major

execute if score #itemio.major load.status matches 0 if score #itemio.minor load.status matches 0 if score #itemio.patch load.status matches 3 run scoreboard players set #simpledrawer.itemio load.status 1
execute if score #smithed.crafter.major load.status matches 0 if score #smithed.crafter.minor load.status matches 1 if score #smithed.crafter.patch load.status matches 0 run scoreboard players set #simpledrawer.smithed.crafter load.status 1
execute if score #smithed.custom_block.major load.status matches 0 if score #smithed.custom_block.minor load.status matches 1 if score #smithed.custom_block.patch load.status matches 0 run scoreboard players set #simpledrawer.smithed.custom_block load.status 1



execute if score #simpledrawer.smithed.custom_block load.status matches 1 if score #simpledrawer.itemio load.status matches 1 if score #simpledrawer.smithed.crafter load.status matches 1 run function simpledrawer:impl/load


execute unless score #simpledrawer.smithed.custom_block load.status matches 1 run tellraw @a [{"translate":"simpledrawer.tellraw_prefix","color":"dark_red"},{"text":"Error Loading SimpleDrawer, Smithed Custom Block v0.1.0+ is required.","color":"red"}]
execute unless score #simpledrawer.itemio load.status matches 1 run tellraw @a [{"translate":"simpledrawer.tellraw_prefix","color":"dark_red"},{"text":"Error Loading SimpleDrawer, ItemIO v0.0.3+ is required.","color":"red"}]
execute unless score #simpledrawer.smithed.crafter load.status matches 1 run tellraw @a [{"translate":"simpledrawer.tellraw_prefix","color":"dark_red"},{"text":"Error Loading SimpleDrawer, Smithed Crafter v0.1.0 is required.","color":"red"}]