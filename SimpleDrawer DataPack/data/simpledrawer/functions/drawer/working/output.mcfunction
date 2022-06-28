#Take #count simpledrawer.io as argument
#Executed by simpledrawer.drawer.item
#Generate simpledrawer:io output
#also #success simpledrawer.io

scoreboard players set #success simpledrawer.io 0
data remove storage simpledrawer:io output


execute if score #count simpledrawer.io matches 0.. if score #count simpledrawer.io >= @s simpledrawer.drawer.Count run function simpledrawer:drawer/working/unfill/sup
execute if score #count simpledrawer.io matches 0.. if score #count simpledrawer.io < @s simpledrawer.drawer.Count run function simpledrawer:drawer/working/unfill/normal