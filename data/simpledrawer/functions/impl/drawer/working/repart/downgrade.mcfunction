
execute as @e[tag=simpledrawer.selected,tag=!simpledrawer.drawer.filled] run function simpledrawer:impl/drawer/working/repart/downgrade_2
execute if entity @e[tag=simpledrawer.selected,tag=simpledrawer.drawer.filled] run function simpledrawer:impl/drawer/working/repart/downgrade_4


