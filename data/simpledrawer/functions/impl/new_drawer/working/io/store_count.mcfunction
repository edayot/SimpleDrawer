
for i in range(3*7):
    data modify entity @s f'item.components."minecraft:custom_data".simpledrawer.items_counts.{i}' set value 0
    data modify entity @s f'item.components."minecraft:custom_data".simpledrawer.items_counts.{i}' set from  entity @s f'item.components."minecraft:container"[{{slot:{i}}}].item.count'












