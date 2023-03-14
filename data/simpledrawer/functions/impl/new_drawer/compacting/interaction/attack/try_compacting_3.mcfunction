

scoreboard players set #count simpledrawer.io -1



execute store result score #globalCount_compacting simpledrawer.math run data get entity @s item.tag.simpledrawer.globalCount
execute store result score #maxCount_compacting simpledrawer.math run data get entity @s item.tag.simpledrawer.maxCount



execute if score #compacting_type simpledrawer.math matches 1 if score #globalCount_compacting simpledrawer.math >= #compacting_nugget_in_ingot simpledrawer.io run scoreboard players operation #count simpledrawer.io = #compacting_nugget_in_ingot simpledrawer.io
execute if score #compacting_type simpledrawer.math matches 2 if score #globalCount_compacting simpledrawer.math >= #compacting_nugget_in_block simpledrawer.io run scoreboard players operation #count simpledrawer.io = #compacting_nugget_in_block simpledrawer.io

execute unless score #count simpledrawer.io matches -1 run function simpledrawer:impl/new_drawer/working/io/output


execute unless score #count simpledrawer.io matches -1 if score #success simpledrawer.io matches 1 run function simpledrawer:impl/new_drawer/compacting/interaction/attack/drop

