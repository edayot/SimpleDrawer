

execute if score @p[tag=SD_adder] SD_sneak matches 1.. run function simpledrawer:working/upgrade/test
execute if entity @s[tag=!SD_upgrade,tag=SD_filled] if score @p[tag=SD_adder] SD_sneak matches 1.. run function simpledrawer:working/fill/bigfill/testbigfill
execute if entity @s[tag=!SD_upgrade,tag=!SD_filled] if score @p[tag=SD_adder] SD_sneak matches 1.. run function simpledrawer:working/fill/firstfill


execute if entity @s[tag=!SD_upgrade,tag=!SD_filled] if score @p[tag=SD_adder] SD_sneak matches 0 run function simpledrawer:working/fill/firstfill
execute if entity @s[tag=!SD_upgrade,tag=SD_filled] if score @p[tag=SD_adder] SD_sneak matches 0 run function simpledrawer:working/fill/testfill
tag @s remove SD_upgrade