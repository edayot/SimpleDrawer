

init_path = ./_
init_path = init_path[:-2]





for i in range(3*9):
    path = f"{init_path}/{i}"
    
    function f"{path}/input":
        scoreboard players set #if_item simpledrawer.math 0
        execute if data entity @s f'item.components."minecraft:container"[{{slot:{i}}}].item' run function ~/if_item
        execute if score #if_item simpledrawer.math matches 0 run function ~/unless_item

        function ~/over:
            scoreboard players operation #newGlobalCount simpledrawer.math = #maxCount simpledrawer.math

            scoreboard players operation #newCount simpledrawer.math -= #inputCount simpledrawer.math 
            scoreboard players operation #newCount simpledrawer.math += #newGlobalCount simpledrawer.math 
            scoreboard players operation #newCount simpledrawer.math -= #globalCount simpledrawer.math 

        function ~/if_item:
            scoreboard players set #if_item simpledrawer.math 1
            # say if item {i}
            data modify storage simpledrawer:main temp.item1 set from storage simpledrawer:io input
            raw f'data modify storage simpledrawer:main temp.item2 set from entity @s item.components."minecraft:container"[{{slot:{i}}}].item'

            data remove storage simpledrawer:main temp.item1.count
            data remove storage simpledrawer:main temp.item2.count

            data remove storage simpledrawer:main temp.item1.Slot
            data remove storage simpledrawer:main temp.item2.Slot

            execute store success score #!same simpledrawer.math run data modify storage simpledrawer:main temp.item1 set from storage simpledrawer:main temp.item2
            execute if score #!same simpledrawer.math matches 0 run function f"{path}/input/if_item_same"
        
        function ~/if_item_same:
            scoreboard players set #success simpledrawer.io 1
            scoreboard players set #modified_slot simpledrawer.io f"{i}"

            data modify storage simpledrawer:io output set from storage simpledrawer:io input


            scoreboard players operation #newGlobalCount simpledrawer.math = #globalCount simpledrawer.math 
            scoreboard players operation #newGlobalCount simpledrawer.math += #inputCount simpledrawer.math 
            execute if data entity @s f'item.components."minecraft:custom_data".simpledrawer.set_count_0_{i}' run scoreboard players remove #newGlobalCount simpledrawer.math 1


            execute store result score #initCount simpledrawer.math run data get entity @s f'item.components."minecraft:container"[{{slot:{i}}}].item.count'
            scoreboard players operation #newCount simpledrawer.math = #initCount simpledrawer.math 
            scoreboard players operation #newCount simpledrawer.math += #inputCount simpledrawer.math 
            execute if data entity @s f'item.components."minecraft:custom_data".simpledrawer.set_count_0_{i}' run scoreboard players remove #newCount simpledrawer.math 1

            execute if score #newGlobalCount simpledrawer.math > #maxCount simpledrawer.math run function f"{path}/input/over"


            # apply new count
            execute store result entity @s item.components."minecraft:custom_data".simpledrawer.globalCount int 1 run scoreboard players get #newGlobalCount simpledrawer.math
            execute store result entity @s f'item.components."minecraft:container"[{{slot:{i}}}].item.count' int 1 run scoreboard players get #newCount simpledrawer.math

            scoreboard players operation #count_insert simpledrawer.io = #newCount simpledrawer.math
            scoreboard players operation #count_insert simpledrawer.io -= #initCount simpledrawer.math
            execute if data entity @s f'item.components."minecraft:custom_data".simpledrawer.set_count_0_{i}' run scoreboard players add #count_insert simpledrawer.io 1
        
        function ~/unless_item:
            scoreboard players set #success simpledrawer.io 1
            scoreboard players set #modified_slot simpledrawer.io f"{i}"


            data modify storage simpledrawer:io output set from storage simpledrawer:io input
            data modify storage simpledrawer:main temp.newItem.item set from storage simpledrawer:io input


            scoreboard players operation #newGlobalCount simpledrawer.math = #globalCount simpledrawer.math 
            scoreboard players operation #newGlobalCount simpledrawer.math += #inputCount simpledrawer.math 

            scoreboard players operation #newCount simpledrawer.math = #inputCount simpledrawer.math 


            execute if score #newGlobalCount simpledrawer.math > #maxCount simpledrawer.math run function f"{path}/input/over"

            # apply new count
            execute store result entity @s item.components."minecraft:custom_data".simpledrawer.globalCount int 1 run scoreboard players get #newGlobalCount simpledrawer.math
            execute store result storage simpledrawer:main temp.newItem.count int 1 run scoreboard players get #newCount simpledrawer.math
            scoreboard players operation #count_insert simpledrawer.io = #newCount simpledrawer.math

            # apply new item
            data modify storage simpledrawer:main temp.newItem.slot set value i
            data modify entity @s item.components."minecraft:container" append from storage simpledrawer:main temp.newItem

            #display
            scoreboard players operation #search_id simpledrawer.math = @s simpledrawer.new_drawer.id
            scoreboard players set #search_slot simpledrawer.math f"{i}"
            data modify storage simpledrawer:main temp.newItem.count set value 1
            execute at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.item_display,limit=1,predicate=simpledrawer:impl/search_id_slot_new_drawer,distance=..10] item set from storage simpledrawer:main temp.newItem.item
                    

    function f"{path}/output":
        scoreboard players set #initCount simpledrawer.math -1
        execute store result score #initCount simpledrawer.math run data get entity @s f'item.components."minecraft:container"[{{slot:{i}}}].item.count'
        execute if data entity @s f'item.components."minecraft:custom_data".simpledrawer.set_count_0_{i}' run scoreboard players set #initCount simpledrawer.math -1

        execute if score #initCount simpledrawer.math matches 1.. if score #count simpledrawer.io >= #initCount simpledrawer.math run function ~/sup
        execute if score #initCount simpledrawer.math matches 1.. if score #count simpledrawer.io < #initCount simpledrawer.math run function ~/normal

        function ~/sup:
            scoreboard players set #success simpledrawer.io 1
            scoreboard players set #modified_slot simpledrawer.io f"{i}"

            data modify storage simpledrawer:io output set from entity @s f'item.components."minecraft:container"[{{slot:{i}}}].item'
            execute store result storage simpledrawer:io output.count int 1 run scoreboard players get #initCount simpledrawer.math
            scoreboard players operation #count_output simpledrawer.io = #initCount simpledrawer.math

            scoreboard players operation #newGlobalCount simpledrawer.math = #globalCount simpledrawer.math
            scoreboard players operation #newGlobalCount simpledrawer.math -= #initCount simpledrawer.math

            execute store result entity @s item.components."minecraft:custom_data".simpledrawer.globalCount int 1 run scoreboard players get #newGlobalCount simpledrawer.math

            data remove entity @s f'item.components."minecraft:container"[{{slot:{i}}}]'

            scoreboard players operation #search_id simpledrawer.math = @s simpledrawer.new_drawer.id
            scoreboard players set #search_slot simpledrawer.math f"{i}"
            scoreboard players set #newCount simpledrawer.math 0
            execute at @s run data remove entity @e[tag=simpledrawer.new_drawer.part.item_display,limit=1,predicate=simpledrawer:impl/search_id_slot_new_drawer,distance=..10] item

        function ~/normal:
            scoreboard players set #success simpledrawer.io 1
            scoreboard players set #modified_slot simpledrawer.io f"{i}"


            data modify storage simpledrawer:io output set from entity @s f'item.components."minecraft:container"[{{slot:{i}}}].item'
            execute store result storage simpledrawer:io output.count int 1 run scoreboard players get #count simpledrawer.io
            scoreboard players operation #count_output simpledrawer.io = #count simpledrawer.io

            scoreboard players operation #newCount simpledrawer.math = #initCount simpledrawer.math
            scoreboard players operation #newCount simpledrawer.math -= #count simpledrawer.io

            scoreboard players operation #newGlobalCount simpledrawer.math = #globalCount simpledrawer.math
            scoreboard players operation #newGlobalCount simpledrawer.math -= #count simpledrawer.io

            execute store result entity @s item.components."minecraft:custom_data".simpledrawer.globalCount int 1 run scoreboard players get #newGlobalCount simpledrawer.math


            execute store result entity @s f'item.components."minecraft:container"[{{slot:{i}}}].item.count' int 1 run scoreboard players get #newCount simpledrawer.math













del ctx.data.functions[f"{init_path}/generate"]