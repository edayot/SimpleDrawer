


for i in range(32):
    f="execute if score #slot simpledrawer.io matches XXX if score #ifsneak simpledrawer.math matches 1 run data modify entity 93682a08-d099-4e8f-a4a6-1e33a3692301 HandItems[0].id set from entity @s item.components."minecraft:custom_data".simpledrawer.Items[{Slot:XXX}].id"
    f=f.replace("XXX",str(i))
    print(f)


