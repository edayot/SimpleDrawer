
for i in range(0,6):
    with open(f"{i}.mcfunction", "w") as f:
        function=f"""

execute store result score #input_slot simpledrawer.io run data get storage simpledrawer:main temp.interact[{i}].slot
execute store result score #interact_type simpledrawer.math run data get storage simpledrawer:main temp.interact[{i}].type
execute store success score #filled simpledrawer.math if score @s simpledrawer.drawer.Count{i} matches 1.. 

"""
        f.write(function)