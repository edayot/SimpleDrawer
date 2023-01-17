function simpledrawer:impl/new_drawer/working/input

execute if score #good_item simpledrawer.math matches 0 run data modify storage smithed.actionbar:input message set value {json: '[{"translate":"simpledrawer.tellraw_prefix","color":"dark_red"},{"translate":"simpledrawer.input_error","color":"red"}]',priority: 'notification'}
execute if score #good_item simpledrawer.math matches 0 as @p[tag=!global.ignore.gui,tag=simpledrawer.adder] run function #smithed.actionbar:message

execute if score #success simpledrawer.io matches 1 run scoreboard players set #already simpledrawer.math 1
