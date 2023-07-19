
scoreboard players set #test_player simpledrawer.math 0


execute store result score #timestamp simpledrawer.math run data get entity @s attack.timestamp

execute if score #timestamp simpledrawer.math = #gametime simpledrawer.math on attacker if entity @s[tag=simpledrawer.attacker] run scoreboard players set #test_player simpledrawer.math 1


execute if score #test_player simpledrawer.math matches 1 run function simpledrawer:impl/new_drawer/working/interaction/attack/test_upgrade



