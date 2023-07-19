



execute if score #good_item simpledrawer.math matches 0 run data modify storage smithed.actionbar:input message set value {json: '[{"translate":"simpledrawer.tellraw_prefix","color":"dark_red"},{"translate":"simpledrawer.input_error","color":"red"}]',priority: 'notification'}
execute if score #good_item simpledrawer.math matches 0 as @p[tag=!global.ignore.gui,tag=simpledrawer.interacter] run function #smithed.actionbar:message







execute if score #success simpledrawer.io matches -2 run data modify storage smithed.actionbar:input message set value {json: '[{"translate":"simpledrawer.tellraw_prefix","color":"dark_red"},{"translate":"simpledrawer.full_error","color":"red"}]',priority: 'notification'}
execute if score #success simpledrawer.io matches -2 as @p[tag=!global.ignore.gui,tag=simpledrawer.interacter] run function #smithed.actionbar:message



