advancement revoke @s only simpledrawer:click

data remove storage simpledrawer:main temp.ItemInput
data modify storage simpledrawer:main temp.ItemInput set from entity @s SelectedItem

scoreboard players set #already simpledrawer.math 0

execute if data storage simpledrawer:main temp.ItemInput if entity @s[predicate=!simpledrawer:sneaking] run function simpledrawer:repart/simple_fill
execute if score #already simpledrawer.math matches 0 unless data storage simpledrawer:main temp.ItemInput if entity @s[predicate=!simpledrawer:sneaking] run function simpledrawer:repart/simple_unfill

