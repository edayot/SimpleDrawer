# @to_update
# update the new_drawer version, simply a copy or maybe a some breaking changes or to handle the new features

# nothing from 1.9.0 to 1.9.1
# nothing from 1.9.1 to 1.9.2


# 1.9.X to 1.10.0 => add simpledrawer.new_drawer.wood_base
# all drawers were wood base in that time
execute
    if score @s simpledrawer.block.major matches 1
    if score @s simpledrawer.block.minor matches 9
    if score @s simpledrawer.block.patch matches 0..2
    run function ./1.9_to_1.10:
        tag @s[tag=!simpledrawer.new_drawer.stone_base] add simpledrawer.new_drawer.wood_base
        scoreboard players set @s simpledrawer.block.major 1
        scoreboard players set @s simpledrawer.block.minor 10
        scoreboard players set @s simpledrawer.block.patch 0


# 1.10.X to 1.11.0 => add score simpledrawer.new_drawer.as_players_entities
# all drawers have players entities in that time
execute
    if score @s simpledrawer.block.major matches 1
    if score @s simpledrawer.block.minor matches 10
    if score @s simpledrawer.block.patch matches 0..
    run function ./1.10_to_1.11:
        scoreboard players set @s simpledrawer.new_drawer.as_players_entities 1
        scoreboard players set @s simpledrawer.block.major 1
        scoreboard players set @s simpledrawer.block.minor 11
        scoreboard players set @s simpledrawer.block.patch 0


execute
    if score @s simpledrawer.block.major matches ..1
    run return fail


execute
    if score @s simpledrawer.block.major matches 2
    if score @s simpledrawer.block.minor matches ..1
    run function ./2.0_2.1_to_2.2:
        scoreboard players set @s simpledrawer.block.major 2
        scoreboard players set @s simpledrawer.block.minor 2
        scoreboard players set @s simpledrawer.block.patch 0
        function simpledrawer:impl/new_drawer/base_display


#copy the new version
scoreboard players operation @s simpledrawer.block.major = #simpledrawer.major load.status
scoreboard players operation @s simpledrawer.block.minor = #simpledrawer.minor load.status
scoreboard players operation @s simpledrawer.block.patch = #simpledrawer.patch load.status
