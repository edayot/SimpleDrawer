scoreboard players set @s simpledrawer.update_guide 0

scoreboard players enable @s simpledrawer.update_guide


data modify storage smithed.actionbar:input message set value {json: '[{"translate":"simpledrawer.tellraw_prefix","color":"green"},{"translate":"simpledrawer.update_guide","color":"white"}]',priority: 'notification'}


scoreboard players set #temp simpledrawer.math 0
execute 
    if predicate simpledrawer:impl/holding_guide_mainhand 
    store success score #temp simpledrawer.math
    run loot replace entity @s weapon.mainhand loot simpledrawer:impl/items/guide
execute
    if score #temp simpledrawer.math matches 0
    if predicate simpledrawer:impl/holding_guide_offhand
    store success score #temp simpledrawer.math
    run loot replace entity @s weapon.offhand loot simpledrawer:impl/items/guide

execute
    if score #temp simpledrawer.math matches 0
    run data modify storage smithed.actionbar:input message set value {json: '[{"translate":"simpledrawer.tellraw_prefix","color":"green"},{"translate":"simpledrawer.update_guide_fail","color":"white"}]',priority: 'notification'}


function #smithed.actionbar:message

