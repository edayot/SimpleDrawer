data modify storage simpledrawer:main drawer_type set value {
    wood:{maxCount:256},
    iron:{maxCount:2048},
    gold:{maxCount:8192},
    diamond:{maxCount:65536},
    star:{maxCount:1048576},
    netherite:{maxCount:1073741824}
}
data modify storage simpledrawer:main config.resummon_range set value 16


scoreboard players set #config.max_resummon simpledrawer.math 4
scoreboard players set #config.alternative_compacting simpledrawer.math 0
scoreboard players set #config.disable_shulker_tape simpledrawer.math 0

scoreboard players set #private.configured simpledrawer.math 1
