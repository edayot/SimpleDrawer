
execute at @s run tag @p[distance=..4,scores={SD_click=1}] add SD_adder

#copy SelectedItem
data remove storage drawer:temp ItemAdded
execute at @s run data modify storage drawer:temp ItemAdded set from entity @p[tag=SD_adder] SelectedItem
execute if data storage drawer:temp ItemAdded run tag @s add asItems


#and see what to do
execute as @s[tag=!asItems] run function drawer:working/unfill/unfill
execute as @s[tag=asItems] run function drawer:working/fill/testfill

tag @s remove asItems
tag @a remove SD_adder
