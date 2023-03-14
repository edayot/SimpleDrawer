# @public
advancement revoke @s only simpledrawer:impl/compacting/interact/ingot

say interact ingot

scoreboard players set #compacting_type simpledrawer.math 1
function simpledrawer:impl/new_drawer/compacting/interaction/interact
