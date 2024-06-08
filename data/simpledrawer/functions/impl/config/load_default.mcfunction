data modify storage simpledrawer:main drawer_type set value {
    wood:{maxCount:256},
    iron:{maxCount:2048},
    gold:{maxCount:8192},
    diamond:{maxCount:65536},
    star:{maxCount:1048576},
    netherite:{maxCount:1073741824}
}


scoreboard players set #configured simpledrawer.config 1
