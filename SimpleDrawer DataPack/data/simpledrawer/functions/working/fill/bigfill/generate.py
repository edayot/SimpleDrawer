import os


for i in range(0,36):
    try:
        os.mkdir("slot"+str(i))
    except:
        pass
    test="""data modify storage simpledrawer:temp ItemInventory set from entity @p[tag=adder] Inventory[{Slot:"""+str(i)+"""b}]
data remove storage simpledrawer:temp ItemInventory.Count
data remove storage simpledrawer:temp ItemInventory.Slot
execute store success storage simpledrawer:temp bigfilltest byte 1 run data modify storage simpledrawer:temp ItemInventory set from storage simpledrawer:temp ItemDrawer
execute if data storage simpledrawer:temp {bigfilltest:0b} run function simpledrawer:working/fill/bigfill/slot"""+str(i)+"""/fill

    """
    fill="""execute store result score nbcrate SD_tempC run data get entity @s Item.tag.data.Count
execute store result score nbplayer SD_tempC run data get entity @p[tag=SD_adder] Inventory[{Slot:"""+str(i)+"""b}].Count
scoreboard players operation nbcrate SD_tempC += nbplayer SD_tempC 
execute if score nbcrate SD_tempC <= maxCount SD_tempC store result entity @s Item.tag.data.Count long 1 run scoreboard players get nbcrate SD_tempC 
execute if score nbcrate SD_tempC <= maxCount SD_tempC run item replace entity @p[tag=SD_adder] container."""+str(i)+""" with air

execute unless score nbcrate SD_tempC <= maxCount SD_tempC run function simpledrawer:working/fill/bigfill/slot"""+str(i)+"""/fullfill

    """
    fullfill="""data modify entity @s Item.tag.data.Count set from entity @s Item.tag.info.maxCount
scoreboard players operation nbcrate SD_tempC -= maxCount SD_tempC



item modify entity @p[tag=SD_adder] container."""+str(i)+""" simpledrawer:set_count

tag @s add SD_full

    """
    with open("slot"+str(i)+"/test.mcfunction","w") as f:
        f.write(test)
    with open("slot"+str(i)+"/fill.mcfunction","w") as f:
        f.write(fill)
    with open("slot"+str(i)+"/fullfill.mcfunction","w") as f:
        f.write(fullfill)

    