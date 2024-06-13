#define storage simpledrawer:main
#define storage simpledrawer:io



scoreboard players set simpledrawer load.status 1
function simpledrawer:impl/set_version
function simpledrawer:impl/versioning_items

gamerule maxCommandChainLength 2147483647






scoreboard objectives add simpledrawer.math dummy
scoreboard objectives add simpledrawer.id dummy

scoreboard objectives add simpledrawer.new_drawer.id dummy
scoreboard objectives add simpledrawer.new_drawer.part_id dummy
scoreboard objectives add simpledrawer.new_drawer.slot_count dummy
scoreboard objectives add simpledrawer.new_drawer.as_players_entities dummy
scoreboard objectives add simpledrawer.new_drawer.no_format_cooldown dummy

# Versioning block for future updates
scoreboard objectives add simpledrawer.block.major dummy
scoreboard objectives add simpledrawer.block.minor dummy
scoreboard objectives add simpledrawer.block.patch dummy


scoreboard objectives add simpledrawer.io dummy
scoreboard objectives add simpledrawer.nb_click dummy



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


execute unless score #private.configured simpledrawer.math matches 1 run function simpledrawer:impl/config/load_default


advancement revoke @a only simpledrawer:impl/interact
advancement revoke @a only simpledrawer:impl/attack


schedule function simpledrawer:impl/tick 1t replace
schedule function simpledrawer:impl/5tick 5t replace

function simpledrawer:impl/mc_version_warning
