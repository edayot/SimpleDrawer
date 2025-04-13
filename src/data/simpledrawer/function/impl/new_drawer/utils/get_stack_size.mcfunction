


execute if data entity @s HandItems[0].components."minecraft:max_stack_size" run return run data get entity @s HandItems[0].components."minecraft:max_stack_size"


execute as @s if items entity @s weapon *[minecraft:max_stack_size=64] run return 64
execute as @s if items entity @s weapon *[minecraft:max_stack_size=16] run return 16
execute as @s if items entity @s weapon *[minecraft:max_stack_size=1] run return 1


for i in range(1, 100):
    if not i in [1, 16, 64]:
        raw f"execute if items entity @s weapon *[minecraft:max_stack_size={i}] run return {i}"




return 1

