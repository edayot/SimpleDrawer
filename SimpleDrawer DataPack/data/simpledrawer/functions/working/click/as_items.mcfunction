

execute if score @p[tag=simpledrawer.adder] simpledrawer.sneak matches 1.. run function simpledrawer:working/upgrade/test
execute if entity @s[tag=!simpledrawer.upgrade,tag=simpledrawer.filled] if score @p[tag=simpledrawer.adder] simpledrawer.sneak matches 1.. run function simpledrawer:working/fill/bigfill/testbigfill
execute if entity @s[tag=!simpledrawer.upgrade,tag=!simpledrawer.filled] if score @p[tag=simpledrawer.adder] simpledrawer.sneak matches 1.. run function simpledrawer:working/fill/firstfilltest


execute if entity @s[tag=!simpledrawer.upgrade,tag=!simpledrawer.filled] if score @p[tag=simpledrawer.adder] simpledrawer.sneak matches 0 run function simpledrawer:working/fill/firstfilltest
execute if entity @s[tag=!simpledrawer.upgrade,tag=simpledrawer.filled] if score @p[tag=simpledrawer.adder] simpledrawer.sneak matches 0 run function simpledrawer:working/fill/testfill
tag @s remove simpledrawer.upgrade