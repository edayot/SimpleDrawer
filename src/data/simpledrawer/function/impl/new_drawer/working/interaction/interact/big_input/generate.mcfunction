init_path = ./_
init_path = init_path[:-2]


for i in range(9*4):
    path = f"{init_path}/{i}"
    function path:
        data remove storage simpledrawer:io input
        raw f"data modify storage simpledrawer:io input set from storage simpledrawer:main temp.Inventory[{{Slot:{i}b}}]"

        scoreboard players set #success simpledrawer.io 0
        scoreboard players set #disable_display simpledrawer.io 1
        execute if data storage simpledrawer:io input run function simpledrawer:impl/new_drawer/working/io/input

        raw f"execute if score #success simpledrawer.io matches 1 run item modify entity @p[tag=simpledrawer.interacter] container.{i} simpledrawer:impl/remove_count_output"
        execute if score #success simpledrawer.io matches 1 run scoreboard players set #one_success simpledrawer.math 1


del ctx.data.functions[f"{init_path}/generate"]