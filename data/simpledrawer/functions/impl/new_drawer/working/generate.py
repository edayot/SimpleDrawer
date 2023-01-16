import os


for i in range(0,6):
    try:
        os.mkdir(f"{i}")
    except:
        pass
    try:
        os.mkdir(f"{i}/fill")
    except:
        pass
    try:
        os.mkdir(f"{i}/unfill")
    except:
        pass



    with open(f"{i}/fill/fill.mcfunction", "w") as f:
        function=f"""

scoreboard players operation #count_total simpledrawer.math = #count_input simpledrawer.math
scoreboard players operation #count_total simpledrawer.math += @s simpledrawer.drawer.Count{i}


execute if score #count_total simpledrawer.math < @s simpledrawer.drawer.maxCount{i} run scoreboard players operation @s simpledrawer.drawer.Count{i} = #count_total simpledrawer.math
execute if score #count_total simpledrawer.math >= @s simpledrawer.drawer.maxCount{i} run scoreboard players operation @s simpledrawer.drawer.Count{i} = @s simpledrawer.drawer.maxCount{i}
#function simpledrawer:impl/drawer/working/display/count

#IO compatibility
data modify storage simpledrawer:io output set from storage simpledrawer:io input

scoreboard players operation #count_output simpledrawer.math = #count_total simpledrawer.math
scoreboard players operation #count_output simpledrawer.math -= @s simpledrawer.drawer.maxCount{i}


execute if score #count_output simpledrawer.math matches 0.. store result storage simpledrawer:io output.Count int 1 run scoreboard players get #count_output simpledrawer.math
execute if score #count_output simpledrawer.math matches 0.. run scoreboard players operation #count_output simpledrawer.io = #count_output simpledrawer.math
execute unless score #count_output simpledrawer.math matches 0.. run data modify storage simpledrawer:io output.Count set value 0
execute unless score #count_output simpledrawer.math matches 0.. run scoreboard players set #count_output simpledrawer.io 0

scoreboard players operation #count_insert simpledrawer.io = #count_input simpledrawer.math
scoreboard players operation #count_insert simpledrawer.io -= #count_output simpledrawer.io

execute if score #count_insert simpledrawer.io = @s simpledrawer.drawer.Count{i} run scoreboard players set #nothing_changed simpledrawer.io 1

        """
        f.write(function)
    with open(f"{i}/fill/first.mcfunction", "w") as f:
        function=f"""
#Copy item, nbt
data modify entity @s Item.tag.simpledrawer.Item{i} set from storage simpledrawer:main temp.input_no_slot
scoreboard players set @s simpledrawer.drawer.Count{i} 0
execute store result score @s simpledrawer.drawer.Count{i} run data get storage simpledrawer:main temp.input_no_slot.Count


#IO compatibility
data modify storage simpledrawer:io output set from storage simpledrawer:io input
data modify storage simpledrawer:io output.Count set value 0b

execute if score @s simpledrawer.drawer.Count{i} > @s simpledrawer.drawer.maxCount{i} store result storage simpledrawer:io output.Count int 1 run scoreboard players get @s simpledrawer.drawer.maxCount{i}
execute if score @s simpledrawer.drawer.Count{i} > @s simpledrawer.drawer.maxCount{i} run scoreboard players operation @s simpledrawer.drawer.Count{i} = @s simpledrawer.drawer.maxCount{i}


#Update display ##TODO




scoreboard players set #success simpledrawer.io 1
scoreboard players set #count_output simpledrawer.io 0
scoreboard players operation #count_insert simpledrawer.io = @s simpledrawer.drawer.Count{i}

        """
        f.write(function)
    
    with open(f"{i}/fill/test_count.mcfunction", "w") as f:
        function=f"""
scoreboard players set #success simpledrawer.io 1
execute store result score #count_input simpledrawer.math run data get storage simpledrawer:io input.Count
execute if score #count_input simpledrawer.math matches 1.. run function simpledrawer:impl/new_drawer/working/{i}/fill/fill
execute if score #count_input simpledrawer.math matches 0 run scoreboard players set #nothing_changed simpledrawer.io 1
"""
        f.write(function)
    with open(f"{i}/fill/test.mcfunction", "w") as f:
        function=f"""
data modify storage simpledrawer:main temp.input_no_slot_no_count set from storage simpledrawer:main temp.input_no_slot
data remove storage simpledrawer:main temp.input_no_slot_no_count.Count

data modify storage simpledrawer:main temp.ItemDrawer_no_count set from storage simpledrawer:main temp.ItemDrawer.tag.simpledrawer.Item{i}
data remove storage simpledrawer:main temp.ItemDrawer_no_count.Count

execute store success score #!same simpledrawer.math run data modify storage simpledrawer:main temp.input_no_slot_no_count set from storage simpledrawer:main temp.ItemDrawer_no_count
execute if score #!same simpledrawer.math matches 0 run function simpledrawer:impl/new_drawer/working/{i}/fill/test_count"""
        f.write(function)

    with open(f"{i}/unfill/normal.mcfunction", "w") as f:
        function=f"""
data modify storage simpledrawer:io output set from entity @s Item.tag.simpledrawer.Item{i}


scoreboard players operation @s simpledrawer.drawer.Count{i} -= #count simpledrawer.io


#IO compatibility

scoreboard players set #success simpledrawer.io 1
execute store result storage simpledrawer:io output.Count int 1 run scoreboard players get #count simpledrawer.io
scoreboard players operation #count_output simpledrawer.io = #count simpledrawer.io
"""
        f.write(function)
    
    with open(f"{i}/unfill/sup.mcfunction", "w") as f:
        function=f"""
data modify storage simpledrawer:io output set from entity @s Item.tag.simpledrawer.Item{i}


data remove entity @s Item.tag.simpledrawer.Item{i}



#IO compatibility

scoreboard players set #success simpledrawer.io 1
execute store result storage simpledrawer:io output.Count int 1 run scoreboard players get @s simpledrawer.drawer.Count{i}
scoreboard players operation #count_output simpledrawer.io = @s simpledrawer.drawer.Count{i}
scoreboard players set @s simpledrawer.drawer.Count{i} 0

"""
        f.write(function)