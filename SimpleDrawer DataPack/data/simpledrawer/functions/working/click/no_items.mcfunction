execute if entity @s[tag=simpledrawer.filled] if score @p[tag=simpledrawer.adder] simpledrawer.sneak matches 1.. run function simpledrawer:working/unfill/testbigunfill
execute if entity @s[tag=simpledrawer.filled] if score @p[tag=simpledrawer.adder] simpledrawer.sneak matches 0 run function simpledrawer:working/unfill/unfill
