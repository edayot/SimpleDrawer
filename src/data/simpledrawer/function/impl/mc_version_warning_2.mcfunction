tag AirDox_ add convention.debug
execute as @a[tag=convention.debug] run function simpledrawer:impl/print_version


execute store result score #dataversion simpledrawer.math run data get entity @p DataVersion


scoreboard players set #goodversion simpledrawer.math 0

# @version_check