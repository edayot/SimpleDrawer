
data remove storage simpledrawer:main temp.OutputCompacting
data modify storage simpledrawer:main temp.OutputCompacting set from storage simpledrawer:io output
execute store result score #countOutput simpledrawer.math run data get storage simpledrawer:main temp.OutputCompacting.Count

execute if score #compacting_type simpledrawer.math matches 1 run data modify storage simpledrawer:main temp.OutputCompacting set from storage simpledrawer:io compacting.ingot
execute if score #compacting_type simpledrawer.math matches 1 run scoreboard players operation #countOutput simpledrawer.math /= #compacting_nugget_in_ingot simpledrawer.io
execute if score #compacting_type simpledrawer.math matches 2 run data modify storage simpledrawer:main temp.OutputCompacting set from storage simpledrawer:io compacting.block
execute if score #compacting_type simpledrawer.math matches 2 run scoreboard players operation #countOutput simpledrawer.math /= #compacting_nugget_in_block simpledrawer.io

execute store result storage simpledrawer:main temp.OutputCompacting.Count int 1 run scoreboard players get #countOutput simpledrawer.math

data modify entity @s Item set from storage simpledrawer:main temp.OutputCompacting


data modify entity @s Owner set from entity @p[tag=simpledrawer.adder] UUID
tag @s remove simpledrawer.summoned
