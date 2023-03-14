# @public
advancement revoke @s only simpledrawer:impl/compacting/interact/block

say interact block

scoreboard players set #compacting_type simpledrawer.math 2
function simpledrawer:impl/new_drawer/compacting/interaction/interact
