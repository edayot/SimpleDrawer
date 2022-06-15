function simpledrawer:repart/simple_unfill_2
scoreboard players remove #nb_empty_slot simpledrawer.math 1
execute if score #nb_empty_slot simpledrawer.math matches 1.. run function simpledrawer:repart/big_unfill_2