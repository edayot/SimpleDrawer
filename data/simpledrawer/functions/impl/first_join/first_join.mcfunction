# @public
execute if score simpledrawer load.status matches 1 run function simpledrawer:impl/first_join/first_join_2
execute unless score simpledrawer load.status matches 1 run advancement revoke @s only simpledrawer:display/root