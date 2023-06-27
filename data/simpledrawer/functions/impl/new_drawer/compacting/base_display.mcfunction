
scoreboard players set @s simpledrawer.new_drawer.slot_count 1




execute store result score #count_display simpledrawer.math run data get entity @s item.tag.simpledrawer.globalCount
execute store result score #maxCount_display simpledrawer.math run data get entity @s item.tag.simpledrawer.maxCount


scoreboard players operation #search_id simpledrawer.math = @s simpledrawer.new_drawer.id
scoreboard players set #search_slot simpledrawer.math 0

execute at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.text_display,limit=1,predicate=simpledrawer:search_id_slot_new_drawer,distance=..10] text set value '[{"score":{"name":"#count_display","objective":"simpledrawer.math"}},{"text":"/"},{"score":{"name":"#maxCount_display","objective":"simpledrawer.math"}}]'

data modify storage simpledrawer:main temp.hopper set from entity @s item.tag.simpledrawer.hopper
data modify storage simpledrawer:main temp.upgrade set from entity @s item.tag.simpledrawer.upgrade


scoreboard players set #model simpledrawer.math 1430000
execute if data storage simpledrawer:main temp{hopper:1b} run scoreboard players add #model simpledrawer.math 2
execute if data storage simpledrawer:main temp{upgrade:"iron"} run scoreboard players add #model simpledrawer.math 4
execute if data storage simpledrawer:main temp{upgrade:"gold"} run scoreboard players add #model simpledrawer.math 8
execute if data storage simpledrawer:main temp{upgrade:"diamond"} run scoreboard players add #model simpledrawer.math 12
execute if data storage simpledrawer:main temp{upgrade:"star"} run scoreboard players add #model simpledrawer.math 16
execute if data storage simpledrawer:main temp{upgrade:"netherite"} run scoreboard players add #model simpledrawer.math 20


execute store result entity @s item.tag.CustomModelData int 1 run scoreboard players get #model simpledrawer.math

#success_compacting simpledrawer.io
scoreboard players operation #display_success_compacting simpledrawer.math = #success_compacting simpledrawer.io
#compacting_nugget_in_ingot simpledrawer.io
scoreboard players operation #display_compacting_nugget_in_ingot simpledrawer.math = #compacting_nugget_in_ingot simpledrawer.io
#compacting_nugget_in_block simpledrawer.io
scoreboard players operation #display_compacting_nugget_in_block simpledrawer.math = #compacting_nugget_in_block simpledrawer.io
#compacting_type simpledrawer.io
scoreboard players operation #display_compacting_type simpledrawer.math = #compacting_type simpledrawer.io
#compacting_do_nugget simpledrawer.io
scoreboard players operation #display_compacting_do_nugget simpledrawer.math = #compacting_do_nugget simpledrawer.io
# storage simpledrawer:io compacting
data modify storage simpledrawer:main temp.display.compacting set from storage simpledrawer:io compacting



data remove storage simpledrawer:io input_compacting
data modify storage simpledrawer:io input_compacting set from entity @s item.tag.simpledrawer.Items[{Slot:0}]
scoreboard players set #success_compacting simpledrawer.io 0
function #simpledrawer:compacting


execute if score #success_compacting simpledrawer.io matches 1 if score #count_display simpledrawer.math >= #compacting_nugget_in_ingot simpledrawer.io at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.item_display_ingot,limit=1,predicate=simpledrawer:search_id_slot_new_drawer,distance=..10] item set from storage simpledrawer:io compacting.ingot
execute if score #success_compacting simpledrawer.io matches 1 if score #count_display simpledrawer.math < #compacting_nugget_in_ingot simpledrawer.io at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.item_display_ingot,limit=1,predicate=simpledrawer:search_id_slot_new_drawer,distance=..10] item set value {id:"minecraft:air"}
execute if score #success_compacting simpledrawer.io matches 0 at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.item_display_ingot,limit=1,predicate=simpledrawer:search_id_slot_new_drawer,distance=..10] item set value {id:"minecraft:air"}

execute if score #success_compacting simpledrawer.io matches 1 if score #count_display simpledrawer.math >= #compacting_nugget_in_block simpledrawer.io at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.item_display_block,limit=1,predicate=simpledrawer:search_id_slot_new_drawer,distance=..10] item set from storage simpledrawer:io compacting.block
execute if score #success_compacting simpledrawer.io matches 1 if score #count_display simpledrawer.math < #compacting_nugget_in_block simpledrawer.io at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.item_display_block,limit=1,predicate=simpledrawer:search_id_slot_new_drawer,distance=..10] item set value {id:"minecraft:air"}
execute if score #success_compacting simpledrawer.io matches 0 at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.item_display_block,limit=1,predicate=simpledrawer:search_id_slot_new_drawer,distance=..10] item set value {id:"minecraft:air"}



#retreive old value
#success_compacting simpledrawer.io
scoreboard players operation #success_compacting simpledrawer.io = #display_success_compacting simpledrawer.math
#compacting_nugget_in_ingot simpledrawer.io
scoreboard players operation #compacting_nugget_in_ingot simpledrawer.io = #display_compacting_nugget_in_ingot simpledrawer.math
#compacting_nugget_in_block simpledrawer.io
scoreboard players operation #compacting_nugget_in_block simpledrawer.io = #display_compacting_nugget_in_block simpledrawer.math
#compacting_type simpledrawer.io
scoreboard players operation #compacting_type simpledrawer.io = #display_compacting_type simpledrawer.math
#compacting_do_nugget simpledrawer.io
scoreboard players operation #compacting_do_nugget simpledrawer.io = #display_compacting_do_nugget simpledrawer.math
# storage simpledrawer:io compacting
data modify storage simpledrawer:io compacting set from storage simpledrawer:main temp.display.compacting
