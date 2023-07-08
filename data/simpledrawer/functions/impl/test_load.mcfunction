


scoreboard players set #simpledrawer.smithed.custom_block load.status 0
scoreboard players set #simpledrawer.itemio load.status 0
scoreboard players set #simpledrawer.smithed.crafter load.status 0
scoreboard players set #simpledrawer.smithed.actionbar load.status 0



# ItemIO version are ^major.minor.patch
scoreboard players set #simpledrawer.itemio.major load.status 0
scoreboard players set #simpledrawer.itemio.minor load.status 5
scoreboard players set #simpledrawer.itemio.patch load.status 0

# Smithed Custom Block version are ^major.minor.patch
scoreboard players set #simpledrawer.smithed.custom_block.major load.status 0
scoreboard players set #simpledrawer.smithed.custom_block.minor load.status 2
scoreboard players set #simpledrawer.smithed.custom_block.patch load.status 0

# Smithed Crafter version are ^major.minor.patch
scoreboard players set #simpledrawer.smithed.crafter.major load.status 0
scoreboard players set #simpledrawer.smithed.crafter.minor load.status 2
scoreboard players set #simpledrawer.smithed.crafter.patch load.status 0

# Smithed Actionbar version are ^major.minor.patch
scoreboard players set #simpledrawer.smithed.actionbar.major load.status 0
scoreboard players set #simpledrawer.smithed.actionbar.minor load.status 4
scoreboard players set #simpledrawer.smithed.actionbar.patch load.status 1





#Check version
execute if score #itemio.major load.status = #simpledrawer.itemio.major load.status if score #itemio.minor load.status = #simpledrawer.itemio.minor load.status if score #itemio.patch load.status >= #simpledrawer.itemio.patch load.status run scoreboard players set #simpledrawer.itemio load.status 1
execute if score #smithed.crafter.major load.status = #simpledrawer.smithed.crafter.major load.status if score #smithed.crafter.minor load.status = #simpledrawer.smithed.crafter.minor load.status if score #smithed.crafter.patch load.status >= #simpledrawer.smithed.crafter.patch load.status run scoreboard players set #simpledrawer.smithed.crafter load.status 1
execute if score #smithed.custom_block.major load.status = #simpledrawer.smithed.custom_block.major load.status if score #smithed.custom_block.minor load.status = #simpledrawer.smithed.custom_block.minor load.status if score #smithed.custom_block.patch load.status >= #simpledrawer.smithed.custom_block.patch load.status run scoreboard players set #simpledrawer.smithed.custom_block load.status 1
execute if score #smithed.actionbar.major load.status = #simpledrawer.smithed.actionbar.major load.status if score #smithed.actionbar.minor load.status = #simpledrawer.smithed.actionbar.minor load.status if score #smithed.actionbar.patch load.status >= #simpledrawer.smithed.actionbar.patch load.status run scoreboard players set #simpledrawer.smithed.actionbar load.status 1



execute if score #simpledrawer.smithed.custom_block load.status matches 1 if score #simpledrawer.itemio load.status matches 1 if score #simpledrawer.smithed.crafter load.status matches 1 if score #simpledrawer.smithed.actionbar load.status matches 1 run function simpledrawer:impl/load


execute unless score #simpledrawer.smithed.custom_block load.status matches 1 run tellraw @a [{"translate":"simpledrawer.tellraw_prefix","color":"dark_red"},{"text":"Error Loading SimpleDrawer, Smithed Custom Block v","color":"red"},{"score":{"name":"#simpledrawer.smithed.custom_block.major","objective":"load.status"},"color":"red"},{"text":".","color":"red"},{"score":{"name":"#simpledrawer.smithed.custom_block.minor","objective":"load.status"},"color":"red"},{"text":".","color":"red"},{"score":{"name":"#simpledrawer.smithed.custom_block.patch","objective":"load.status"},"color":"red"},{"text":"+ is required.","color":"red"}]
execute unless score #simpledrawer.itemio load.status matches 1 run tellraw @a [{"translate":"simpledrawer.tellraw_prefix","color":"dark_red"},{"text":"Error Loading SimpleDrawer, ItemIO v","color":"red"},{"score":{"name":"#simpledrawer.itemio.major","objective":"load.status"},"color":"red"},{"text":".","color":"red"},{"score":{"name":"#simpledrawer.itemio.minor","objective":"load.status"},"color":"red"},{"text":".","color":"red"},{"score":{"name":"#simpledrawer.itemio.patch","objective":"load.status"},"color":"red"},{"text":"+ is required.","color":"red"}]
execute unless score #simpledrawer.smithed.crafter load.status matches 1 run tellraw @a [{"translate":"simpledrawer.tellraw_prefix","color":"dark_red"},{"text":"Error Loading SimpleDrawer, Smithed Crafter v","color":"red"},{"score":{"name":"#simpledrawer.smithed.crafter.major","objective":"load.status"},"color":"red"},{"text":".","color":"red"},{"score":{"name":"#simpledrawer.smithed.crafter.minor","objective":"load.status"},"color":"red"},{"text":".","color":"red"},{"score":{"name":"#simpledrawer.smithed.crafter.patch","objective":"load.status"},"color":"red"},{"text":"+ is required.","color":"red"}]
execute unless score #simpledrawer.smithed.actionbar load.status matches 1 run tellraw @a [{"translate":"simpledrawer.tellraw_prefix","color":"dark_red"},{"text":"Error Loading SimpleDrawer, Smithed Actionbar v","color":"red"},{"score":{"name":"#simpledrawer.smithed.actionbar.major","objective":"load.status"},"color":"red"},{"text":".","color":"red"},{"score":{"name":"#simpledrawer.smithed.actionbar.minor","objective":"load.status"},"color":"red"},{"text":".","color":"red"},{"score":{"name":"#simpledrawer.smithed.actionbar.patch","objective":"load.status"},"color":"red"},{"text":"+ is required.","color":"red"}]
