# @public

data modify storage simpledrawer:main temp.args set value {
    lod_reconstruction: 4,
    lod_range: 16,
    alternative_compacting: 0,
    disable_shulker_tape: 0,
    iron_capacity: 2048,
    gold_capacity: 8192,
    diamond_capacity: 65536,
    star_capacity: 1048576,
    netherite_capacity: 1073741824
}

execute store result storage simpledrawer:main temp.args.lod_reconstruction int 1 run scoreboard players get #config.max_resummon simpledrawer.math
execute store result storage simpledrawer:main temp.args.lod_range int 1 run data get storage simpledrawer:main config.resummon_range
execute store result storage simpledrawer:main temp.args.alternative_compacting int 1 run scoreboard players get #config.alternative_compacting simpledrawer.math
execute store result storage simpledrawer:main temp.args.disable_shulker_tape int 1 run scoreboard players get #config.disable_shulker_tape simpledrawer.math
execute store result storage simpledrawer:main temp.args.iron_capacity int 1 run data get storage simpledrawer:main drawer_type.iron.maxCount
execute store result storage simpledrawer:main temp.args.gold_capacity int 1 run data get storage simpledrawer:main drawer_type.gold.maxCount
execute store result storage simpledrawer:main temp.args.diamond_capacity int 1 run data get storage simpledrawer:main drawer_type.diamond.maxCount
execute store result storage simpledrawer:main temp.args.star_capacity int 1 run data get storage simpledrawer:main drawer_type.star.maxCount
execute store result storage simpledrawer:main temp.args.netherite_capacity int 1 run data get storage simpledrawer:main drawer_type.netherite.maxCount


function simpledrawer:impl/config/internal_config with storage simpledrawer:main temp.args