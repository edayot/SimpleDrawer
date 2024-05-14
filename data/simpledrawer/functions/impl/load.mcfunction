#define storage simpledrawer:main
#define storage simpledrawer:io



scoreboard players set simpledrawer load.status 1
function simpledrawer:impl/set_version

gamerule maxCommandChainLength 2147483647






scoreboard objectives add simpledrawer.math dummy
scoreboard objectives add simpledrawer.id dummy

scoreboard objectives add simpledrawer.new_drawer.id dummy
scoreboard objectives add simpledrawer.new_drawer.part_id dummy
scoreboard objectives add simpledrawer.new_drawer.slot_count dummy
scoreboard objectives add simpledrawer.new_drawer.as_players_entities dummy

# Versioning block for future updates
scoreboard objectives add simpledrawer.block.major dummy
scoreboard objectives add simpledrawer.block.minor dummy
scoreboard objectives add simpledrawer.block.patch dummy


scoreboard objectives add simpledrawer.io dummy
scoreboard objectives add simpledrawer.player.output_cooldown dummy
scoreboard objectives add simpledrawer.player.input_cooldown dummy
scoreboard objectives add simpledrawer.player.last_id dummy
scoreboard objectives add simpledrawer.nb_click dummy

scoreboard objectives add simpledrawer.config trigger
scoreboard players enable @a simpledrawer.config

scoreboard objectives add simpledrawer.update_guide trigger
scoreboard players enable @a simpledrawer.update_guide

scoreboard objectives add simpledrawer.leave_game minecraft.custom:minecraft.leave_game

scoreboard objectives add simpledrawer.config.output_mode dummy
scoreboard objectives add simpledrawer.config.input_mode dummy

scoreboard players set #9 simpledrawer.math 9
scoreboard players set #81 simpledrawer.math 81
scoreboard players set #10 simpledrawer.math 10
scoreboard players set #100 simpledrawer.math 100
scoreboard players set #1000 simpledrawer.math 1000
scoreboard players set #10000 simpledrawer.math 10000
scoreboard players set #100000 simpledrawer.math 100000
scoreboard players set #1000000 simpledrawer.math 1000000
scoreboard players set #10000000 simpledrawer.math 10000000
scoreboard players set #100000000 simpledrawer.math 100000000
scoreboard players set #1000000000 simpledrawer.math 1000000000

scoreboard players set #max_resummon simpledrawer.math 4

execute unless score #configured simpledrawer.config matches 1 run function simpledrawer:impl/config/load_default


advancement revoke @a only simpledrawer:impl/interact
advancement revoke @a only simpledrawer:impl/attack
advancement revoke @a only simpledrawer:impl/click


schedule function simpledrawer:impl/tick 1t replace
schedule function simpledrawer:impl/5tick 5t replace
schedule function simpledrawer:impl/20tick 20t replace

function simpledrawer:impl/mc_version_warning

setblock -29999990 33 1610 air
setblock -29999990 33 1610 player_head{SkullOwner:{Name:"jeb_"}}


scoreboard players set #second_in_a_year simpledrawer.math 315576 # = 60*60*24*365.25 / 100 (for precision)
function simpledrawer:impl/timestamp