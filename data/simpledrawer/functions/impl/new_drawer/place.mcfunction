

execute if block ~ ~ ~ furnace[facing=north] rotated 180 0 align xyz positioned ~.5 ~.5 ~.5 run function simpledrawer:impl/new_drawer/place/rotated
execute if block ~ ~ ~ furnace[facing=south] rotated 0 0 align xyz positioned ~.5 ~.5 ~.5 run function simpledrawer:impl/new_drawer/place/rotated
execute if block ~ ~ ~ furnace[facing=east] rotated -90 0 align xyz positioned ~.5 ~.5 ~.5 run function simpledrawer:impl/new_drawer/place/rotated
execute if block ~ ~ ~ furnace[facing=west] rotated 90 0 align xyz positioned ~.5 ~.5 ~.5 run function simpledrawer:impl/new_drawer/place/rotated

