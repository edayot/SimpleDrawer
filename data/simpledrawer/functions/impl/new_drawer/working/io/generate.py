import os


chaine='[{"score":{"name":"#newCount","objective":"simpledrawer.math"}},{"text":"/"},{"score":{"name":"#maxCount","objective":"simpledrawer.math"}}]'

for i in range(3*9):

    #create folder
    try:
        os.mkdir(f"{i}")
    except:
        pass
    try:
        os.mkdir(f"{i}/input")
    except:
        pass
    try:
        os.mkdir(f"{i}/output")
    except:
        pass

    input=f"""



#say {i}

scoreboard players set #if_item simpledrawer.math 0
execute if data entity @s item.components."minecraft:container"[{{slot:{i}}}].item run function simpledrawer:impl/new_drawer/working/io/{i}/input/if_item
execute if score #if_item simpledrawer.math matches 0 run function simpledrawer:impl/new_drawer/working/io/{i}/input/unless_item


"""
    with open(f"{i}/input.mcfunction", "w") as f:
        f.write(input)
    
    output=f"""

scoreboard players set #initCount simpledrawer.math -1
execute store result score #initCount simpledrawer.math run data get entity @s item.components."minecraft:container"[{{slot:{i}}}].item.count



execute if score #initCount simpledrawer.math matches 1.. if score #count simpledrawer.io >= #initCount simpledrawer.math run function simpledrawer:impl/new_drawer/working/io/{i}/output/sup
execute if score #initCount simpledrawer.math matches 1.. if score #count simpledrawer.io < #initCount simpledrawer.math run function simpledrawer:impl/new_drawer/working/io/{i}/output/normal


"""
    with open(f"{i}/output.mcfunction", "w") as f:
        f.write(output)
    
    #input
    if_item=f"""
scoreboard players set #if_item simpledrawer.math 1
#say if item
data modify storage simpledrawer:main temp.item1 set from storage simpledrawer:io input
data modify storage simpledrawer:main temp.item2 set from entity @s item.components."minecraft:container"[{{slot:{i}}}].item

data remove storage simpledrawer:main temp.item1.count
data remove storage simpledrawer:main temp.item2.count

data remove storage simpledrawer:main temp.item1.Slot
data remove storage simpledrawer:main temp.item2.Slot

execute store success score #!same simpledrawer.math run data modify storage simpledrawer:main temp.item1 set from storage simpledrawer:main temp.item2
execute if score #!same simpledrawer.math matches 0 run function simpledrawer:impl/new_drawer/working/io/{i}/input/if_item_same





"""
    with open(f"{i}/input/if_item.mcfunction", "w") as f:
        f.write(if_item)
    
    if_item_same=f"""
scoreboard players set #success simpledrawer.io 1
scoreboard players set #modified_slot simpledrawer.io {i}

data modify storage simpledrawer:io output set from storage simpledrawer:io input


scoreboard players operation #newGlobalCount simpledrawer.math = #globalCount simpledrawer.math 
scoreboard players operation #newGlobalCount simpledrawer.math += #inputCount simpledrawer.math 


execute store result score #initCount simpledrawer.math run data get entity @s item.components."minecraft:container"[{{slot:{i}}}].item.count
scoreboard players operation #newCount simpledrawer.math = #initCount simpledrawer.math 
scoreboard players operation #newCount simpledrawer.math += #inputCount simpledrawer.math 

execute if score #newGlobalCount simpledrawer.math > #maxCount simpledrawer.math run function simpledrawer:impl/new_drawer/working/io/{i}/input/over


# apply new count
execute store result entity @s item.components."minecraft:custom_data".simpledrawer.globalCount int 1 run scoreboard players get #newGlobalCount simpledrawer.math
execute store result entity @s item.components."minecraft:container"[{{slot:{i}}}].item.count int 1 run scoreboard players get #newCount simpledrawer.math

scoreboard players operation #count_insert simpledrawer.io = #newCount simpledrawer.math
scoreboard players operation #count_insert simpledrawer.io -= #initCount simpledrawer.math


"""
    if_item_same=if_item_same.replace("___chaine___",chaine)
    with open(f"{i}/input/if_item_same.mcfunction", "w") as f:
        f.write(if_item_same)
    
    over=f"""


scoreboard players operation #newGlobalCount simpledrawer.math = #maxCount simpledrawer.math

scoreboard players operation #newCount simpledrawer.math -= #inputCount simpledrawer.math 
scoreboard players operation #newCount simpledrawer.math += #newGlobalCount simpledrawer.math 
scoreboard players operation #newCount simpledrawer.math -= #globalCount simpledrawer.math 


"""
    with open(f"{i}/input/over.mcfunction", "w") as f:
        f.write(over)
    
    unless_item=f"""

scoreboard players set #success simpledrawer.io 1
scoreboard players set #modified_slot simpledrawer.io {i}


data modify storage simpledrawer:io output set from storage simpledrawer:io input
data modify storage simpledrawer:main temp.newItem.item set from storage simpledrawer:io input


scoreboard players operation #newGlobalCount simpledrawer.math = #globalCount simpledrawer.math 
scoreboard players operation #newGlobalCount simpledrawer.math += #inputCount simpledrawer.math 

scoreboard players operation #newCount simpledrawer.math = #inputCount simpledrawer.math 


execute if score #newGlobalCount simpledrawer.math > #maxCount simpledrawer.math run function simpledrawer:impl/new_drawer/working/io/{i}/input/over



# apply new count
execute store result entity @s item.components."minecraft:custom_data".simpledrawer.globalCount int 1 run scoreboard players get #newGlobalCount simpledrawer.math
execute store result storage simpledrawer:main temp.newItem.count int 1 run scoreboard players get #newCount simpledrawer.math
scoreboard players operation #count_insert simpledrawer.io = #newCount simpledrawer.math

# apply new item
data modify storage simpledrawer:main temp.newItem.slot set value {i}
data modify entity @s item.components."minecraft:container" append from storage simpledrawer:main temp.newItem

#display
scoreboard players operation #search_id simpledrawer.math = @s simpledrawer.new_drawer.id
scoreboard players set #search_slot simpledrawer.math {i}
data modify storage simpledrawer:main temp.newItem.count set value 1
execute at @s run data modify entity @e[tag=simpledrawer.new_drawer.part.item_display,limit=1,predicate=simpledrawer:impl/search_id_slot_new_drawer,distance=..10] item set from storage simpledrawer:main temp.newItem.item
"""
    unless_item=unless_item.replace("___chaine___",chaine)
    with open(f"{i}/input/unless_item.mcfunction", "w") as f:
        f.write(unless_item)
    
    #output
    sup=f"""

scoreboard players set #success simpledrawer.io 1
scoreboard players set #modified_slot simpledrawer.io {i}



data modify storage simpledrawer:io output set from entity @s item.components."minecraft:container"[{{slot:{i}}}].item
execute store result storage simpledrawer:io output.count int 1 run scoreboard players get #initCount simpledrawer.math
scoreboard players operation #count_output simpledrawer.io = #initCount simpledrawer.math


scoreboard players operation #newGlobalCount simpledrawer.math = #globalCount simpledrawer.math
scoreboard players operation #newGlobalCount simpledrawer.math -= #initCount simpledrawer.math

execute store result entity @s item.components."minecraft:custom_data".simpledrawer.globalCount int 1 run scoreboard players get #newGlobalCount simpledrawer.math


data remove entity @s item.components."minecraft:container"[{{slot:{i}}}]

scoreboard players operation #search_id simpledrawer.math = @s simpledrawer.new_drawer.id
scoreboard players set #search_slot simpledrawer.math {i}
scoreboard players set #newCount simpledrawer.math 0
execute at @s run data remove entity @e[tag=simpledrawer.new_drawer.part.item_display,limit=1,predicate=simpledrawer:impl/search_id_slot_new_drawer,distance=..10] item

"""
    sup=sup.replace("___chaine___",chaine)
    with open(f"{i}/output/sup.mcfunction", "w") as f:
        f.write(sup)
    
    normal=f"""

scoreboard players set #success simpledrawer.io 1
scoreboard players set #modified_slot simpledrawer.io {i}


data modify storage simpledrawer:io output set from entity @s item.components."minecraft:container"[{{slot:{i}}}].item
execute store result storage simpledrawer:io output.count int 1 run scoreboard players get #count simpledrawer.io
scoreboard players operation #count_output simpledrawer.io = #count simpledrawer.io

scoreboard players operation #newCount simpledrawer.math = #initCount simpledrawer.math
scoreboard players operation #newCount simpledrawer.math -= #count simpledrawer.io

scoreboard players operation #newGlobalCount simpledrawer.math = #globalCount simpledrawer.math
scoreboard players operation #newGlobalCount simpledrawer.math -= #count simpledrawer.io

execute store result entity @s item.components."minecraft:custom_data".simpledrawer.globalCount int 1 run scoreboard players get #newGlobalCount simpledrawer.math


execute store result entity @s item.components."minecraft:container"[{{slot:{i}}}].item.count int 1 run scoreboard players get #newCount simpledrawer.math




"""
    normal=normal.replace("___chaine___",chaine)
    with open(f"{i}/output/normal.mcfunction", "w") as f:
        f.write(normal)
    





