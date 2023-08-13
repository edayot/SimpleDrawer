scoreboard players set @s simpledrawer.update_guide 0

scoreboard players enable @s simpledrawer.update_guide


data modify storage smithed.actionbar:input message set value {json: '[{"translate":"simpledrawer.tellraw_prefix","color":"green"},{"translate":"simpledrawer.update_guide","color":"white"}]',priority: 'notification'}
function #smithed.actionbar:message

execute if predicate simpledrawer:impl/holding_guide_mainhand run item modify entity @s weapon.mainhand simpledrawer:impl/update_guide
execute if predicate simpledrawer:impl/holding_guide_offhand run item modify entity @s weapon.offhand simpledrawer:impl/update_guide




