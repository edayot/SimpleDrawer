data modify storage smithed.actionbar:input message set value {json: '[{"translate":"simpledrawer.tellraw_prefix","color":"dark_red"},{"translate":"simpledrawer.text.cant_downgrade","color":"red"}]',priority: 'notification'}
execute as @p[tag=simpledrawer.adder] run function #smithed.actionbar:message
scoreboard players set #already simpledrawer.math 1

