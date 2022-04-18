

execute if score @p[tag=simpledrawer.adder] simpledrawer.sneak matches 1.. run function simpledrawer:working/upgrade/test
execute if entity @s[tag=!simpledrawer.upgrade,tag=simpledrawer.filled] if entity @p[tag=simpledrawer.adder,predicate=simpledrawer:is_sneaking] run function simpledrawer:working/fill/bigfill/testbigfill
execute if entity @s[tag=!simpledrawer.upgrade,tag=simpledrawer.filled] unless entity @p[tag=simpledrawer.adder,predicate=simpledrawer:is_sneaking] run function simpledrawer:working/fill/testfill

execute if entity @s[tag=!simpledrawer.upgrade,tag=!simpledrawer.filled] run function simpledrawer:working/fill/firstfilltest

tag @s remove simpledrawer.upgrade