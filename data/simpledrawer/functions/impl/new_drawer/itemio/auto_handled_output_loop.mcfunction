
execute store result score #count_aho simpledrawer.math run data get storage simpledrawer:main temp.Items_aho[0].Count

execute if score #count_aho simpledrawer.math matches 1.. 
    run function ./auto_handled_output_loop_output:
    data modify storage itemio:io Item_auto_output set from storage simpledrawer:main temp.Items_aho[0]
    #tellraw @a {"nbt":"Item_auto_output","storage":"itemio:io"}
    function #itemio:calls/auto_handled_output
    #tellraw @a {"score":{"name":"#remove_count","objective":"itemio.math.output"}}

    scoreboard players operation #count simpledrawer.io = #remove_count itemio.math.output
    execute store result score #slot simpledrawer.io run data get storage simpledrawer:main temp.Items_aho[0].Slot
    execute if score #success_output itemio.io matches 1 run function simpledrawer:impl/new_drawer/working/io/output


execute unless score #success_output itemio.io matches 1 run data remove storage simpledrawer:main temp.Items_aho[0]
execute unless score #success_output itemio.io matches 1 if data storage simpledrawer:main temp.Items_aho[0] run function simpledrawer:impl/new_drawer/itemio/auto_handled_output_loop

