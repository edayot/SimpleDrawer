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




#copy the new version
scoreboard players operation @s simpledrawer.block.major = #simpledrawer.major load.status
scoreboard players operation @s simpledrawer.block.minor = #simpledrawer.minor load.status
scoreboard players operation @s simpledrawer.block.patch = #simpledrawer.patch load.status