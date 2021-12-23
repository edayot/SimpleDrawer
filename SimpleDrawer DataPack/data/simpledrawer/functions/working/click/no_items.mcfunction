execute if entity @s[tag=SD_filled] if score @p[tag=SD_adder] SD_sneak matches 1.. run function simpledrawer:working/unfill/testbigunfill
execute if entity @s[tag=SD_filled] if score @p[tag=SD_adder] SD_sneak matches 0 run function simpledrawer:working/unfill/unfill
