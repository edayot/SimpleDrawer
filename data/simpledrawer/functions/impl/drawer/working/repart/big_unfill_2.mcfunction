function simpledrawer:impl/drawer/working/repart/simple_unfill_2
scoreboard players remove #nb_empty_slot simpledrawer.math 1
execute if score #nb_empty_slot simpledrawer.math matches 1.. if entity @s[tag=simpledrawer.drawer.filled] run function simpledrawer:impl/drawer/working/repart/big_unfill_2