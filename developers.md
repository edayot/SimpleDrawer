## `#simpledrawer:material`

Add your custom material to this function tag to make it compatible with the compacting drawer.


| Input Name                            | Input Type   | Input Source             | Input Objective/Path    | 
| ---                                   | ---          | ---                      | ---                     | 
| 'Success'                 | score        | #success_material        | simpledrawer.io         | 
| 'The item'                   | storage      | item_material            | simpledrawer:io         |


| Output Name       | Output Type  | Output Source             | Output Objective/Path    | 
| ---               | ---          | ---                       | ---                     | 
| 'Success'         | score        | #success_material         | simpledrawer.io             | 
| 'The material'                   | storage      | material            | simpledrawer:io         |
| 'Type of compacting' <br> (0: block, 1: ingot, 2: nugget)        | score        | #type         | simpledrawer.io             | 
| 'Number of ingot in a block'         | score        | #ingot_in_block         | simpledrawer.io             | 
| 'Number of nugget in a block'         | score        | #nugget_in_block         | simpledrawer.io             |
| 'Number of nugget in a ingot'         | score        | #nugget_in_ingot         | simpledrawer.io             |
| 'Slot count'         | score        | @s         | simpledrawer.new_drawer.slot_count             |



### Example
The function tag will be called when the material of the item need to be checked.

```mcfunction

execute 
    unless score #success_material simpledrawer.io matches 1
    if data storage simpledrawer:io item_material{tag:{ctc:{id:"my_block",from:"my_data_pack"}}}
    run function my_data_pack:my_material/block:
        scoreboard players set #type simpledrawer.io 0
        function my_data_pack:my_material
execute 
    unless score #success_material simpledrawer.io matches 1
    if data storage simpledrawer:io item_material{tag:{ctc:{id:"my_ingot",from:"my_data_pack"}}}
    run function my_data_pack:my_material/block:
        scoreboard players set #type simpledrawer.io 1
        function my_data_pack:my_material
execute
    unless score #success_material simpledrawer.io matches 1
    if data storage simpledrawer:io item_material{tag:{ctc:{id:"my_nugget",from:"my_data_pack"}}}
    run function my_data_pack:my_material/block:
        scoreboard players set #type simpledrawer.io 2
        function my_data_pack:my_material

```

```mcfunction


function my_data_pack:my_material
    scoreboard players set #success_material simpledrawer.io 1

    scoreboard players set #ingot_in_block simpledrawer.io 9
    scoreboard players set #nugget_in_block simpledrawer.io 81
    scoreboard players set #nugget_in_ingot simpledrawer.io 9

    # 3 If the material has a block form, an ingot form and a nugget form
    # 2 If the material has a block form, and an ingot form 
    scoreboard players set @s simpledrawer.new_drawer.slot_count 3 

    data modify storage simpledrawer:io material set value {
        material: '{"translate":"my_data_pack.my_material"}' # The json text component of the material name
        block: <The block NBT> # The block NBT of the block form of the material
        ingot: <The item NBT> # The item NBT of the ingot form of the material
        nugget: <The item NBT> # The item NBT of the nugget form of the material, air if the material doesn't have a nugget form
    }

```