scoreboard players set #success_version simpledrawer.math 1


scoreboard players set #facing simpledrawer.math 0
execute if block ~ ~ ~ furnace[facing=north] run scoreboard players set #facing simpledrawer.math 0
execute if block ~ ~ ~ furnace[facing=south] run scoreboard players set #facing simpledrawer.math 1
execute if block ~ ~ ~ furnace[facing=east] run scoreboard players set #facing simpledrawer.math 2
execute if block ~ ~ ~ furnace[facing=west] run scoreboard players set #facing simpledrawer.math 3




execute if score #facing simpledrawer.math matches 0 rotated 180 0 align xyz positioned ~.5 ~.5 ~.5 run function simpledrawer:impl/new_drawer/place/rotated
execute if score #facing simpledrawer.math matches 1 rotated 0 0 align xyz positioned ~.5 ~.5 ~.5 run function simpledrawer:impl/new_drawer/place/rotated
execute if score #facing simpledrawer.math matches 2 rotated -90 0 align xyz positioned ~.5 ~.5 ~.5 run function simpledrawer:impl/new_drawer/place/rotated
execute if score #facing simpledrawer.math matches 3 rotated 90 0 align xyz positioned ~.5 ~.5 ~.5 run function simpledrawer:impl/new_drawer/place/rotated

