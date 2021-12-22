
execute at @s run tag @p[distance=..4,scores={SD_click=1}] add SD_adder

execute if score @p[tag=SD_adder] SD_sneak matches ..0 run function simpledrawer:working/fill/firstfill
execute if score @p[tag=SD_adder] SD_sneak matches 1.. run function simpledrawer:working/upgrade/test


data modify entity @s ItemRotation set value 0b
tag @a remove SD_adder
