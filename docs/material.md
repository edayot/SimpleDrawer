
# 💎 Adding your own material


## Function Tag 

### `#simpledrawer:material`

Add your custom material to this function tag to make it compatible with the compacting drawer.

#### Inputs
| Input Name                            | Input Type   | Input Source             | Input Objective/Path    | 
| ---                                   | ---          | ---                      | ---                     | 
| Success                               | score        | #success_material        | simpledrawer.io         | 
| The item                              | storage      | item_material            | simpledrawer:io         |


#### Outputs
| Output Name                                                           | Output Type  | Output Source                      | Output Objective/Path     | 
| ---                                                                   | ---          | ---                                | ---                       | 
| Success                                                               | score        | #success_material                  | simpledrawer.io           | 
| The material                                                          | storage      | material                           | simpledrawer:io           |
| Type of compacting<br> (0: block, 1: ingot, 2: nugget)                | score        | #type                              | simpledrawer.io           | 
| Number of ingot in a block                                            | score        | #ingot_in_block                    | simpledrawer.io           | 
| Number of nugget in a ingot                                           | score        | #nugget_in_ingot                   | simpledrawer.io           |



#### Basic format
The function tag will be called when the material of the item need to be checked.



###### In the function tag
```{code-block} mcfunction
:force:

execute 
    unless score #success_material simpledrawer.io matches 1
    if data storage simpledrawer:io item_material{
        components:{"minecraft:custom_data":{ctc:{id:"my_block",from:"my_data_pack"}}}
    }
    run function my_data_pack:my_material/block:
        scoreboard players set #type simpledrawer.io 0
        function my_data_pack:my_material
execute 
    unless score #success_material simpledrawer.io matches 1
    if data storage simpledrawer:io item_material{
        components:{"minecraft:custom_data":{ctc:{id:"my_ingot",from:"my_data_pack"}}}
    }
    run function my_data_pack:my_material/block:
        scoreboard players set #type simpledrawer.io 1
        function my_data_pack:my_material
execute
    unless score #success_material simpledrawer.io matches 1
    if data storage simpledrawer:io item_material{
        components:{"minecraft:custom_data":{ctc:{id:"my_nugget",from:"my_data_pack"}}}
    }
    run function my_data_pack:my_material/block:
        scoreboard players set #type simpledrawer.io 2
        function my_data_pack:my_material
```


###### Material function

```{code-block} mcfunction
:force:
function my_data_pack:my_material
    scoreboard players set #success_material simpledrawer.io 1

    scoreboard players set #ingot_in_block simpledrawer.io 9
    scoreboard players set #nugget_in_ingot simpledrawer.io 9


    data modify storage simpledrawer:io material set value {
        material: "my_data_pack.my_material', # The UNIQUE identifier of the material, should be namespaced
        material_name: '{"text":"My material"}', # The json text component of the material name

        block: <The block NBT>, # The block NBT of the block form of the material
        ingot: <The ingot NBT>, # The item NBT of the ingot form of the material
        nugget: <The nugget NBT> # The item NBT of the nugget form of the material, don't declare if the material doesn't have a nugget form
    }

```


#### Example repository

Take a look at the this [example datapack](https://github.com/edayot/SimpleDrawer/tree/master/example_material) to see how to add your own material.