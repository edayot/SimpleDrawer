execute if entity @s[tag=simpledrawer.filled] if entity @p[tag=simpledrawer.adder,predicate=simpledrawer:is_sneaking] run function simpledrawer:working/unfill/testbigunfill
execute if entity @s[tag=simpledrawer.filled] unless entity @p[tag=simpledrawer.adder,predicate=simpledrawer:is_sneaking] run function simpledrawer:working/unfill/unfill
