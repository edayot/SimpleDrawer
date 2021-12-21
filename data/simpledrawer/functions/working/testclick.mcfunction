
execute at @s run tag @p[distance=..4,scores={SD_click=1}] add SD_adder

#copy SelectedItem
data remove storage simpledrawertemp ItemAdded
execute at @s run data modify storage simpledrawertemp ItemAdded set from entity @p[tag=SD_adder] SelectedItem
execute if data storage simpledrawertemp ItemAdded run tag @s add asItems


#and see what to do
execute as @s[tag=!asItems] run function simpledrawerworking/unfill/unfill
execute as @s[tag=asItems] run function simpledrawerworking/fill/testfill

tag @s remove asItems
tag @a remove SD_adder
