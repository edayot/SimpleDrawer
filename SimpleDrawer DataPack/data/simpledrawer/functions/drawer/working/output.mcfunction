#Take #count simpledrawer.io as argument
#Executed by simpledrawer.drawer.item
data modify storage simpledrawer:io success set value 0
data remove storage simpledrawer:io output
execute store result score #count_drawer simpledrawer.math run data get entity @s Item.tag.simpledrawer.Item.Count

execute if score #count simpledrawer.io matches 0.. if score #count simpledrawer.io < #count_drawer simpledrawer.math run function simpledrawer:drawer/working/unfill/normal
execute if score #count simpledrawer.io matches 0.. if score #count simpledrawer.io >= #count_drawer simpledrawer.math run function simpledrawer:drawer/working/unfill/sup