# @public
advancement revoke @s only simpledrawer:impl/compacting/attack/ingot
say attack ingot

scoreboard players set #compacting_type simpledrawer.math 1
function simpledrawer:impl/new_drawer/compacting/interaction/attack