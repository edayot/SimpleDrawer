

function simpledrawer:impl/drawer/working/set_maxcount

scoreboard players operation #maxCount simpledrawer.math = @s simpledrawer.drawer.maxCount
scoreboard players operation #maxCount simpledrawer.math /= @s simpledrawer.drawer.nb_enabled

scoreboard players operation @s simpledrawer.drawer.maxCount0 = #maxCount simpledrawer.math
scoreboard players operation @s simpledrawer.drawer.maxCount1 = #maxCount simpledrawer.math
scoreboard players operation @s simpledrawer.drawer.maxCount2 = #maxCount simpledrawer.math
scoreboard players operation @s simpledrawer.drawer.maxCount3 = #maxCount simpledrawer.math
scoreboard players operation @s simpledrawer.drawer.maxCount4 = #maxCount simpledrawer.math
scoreboard players operation @s simpledrawer.drawer.maxCount5 = #maxCount simpledrawer.math
