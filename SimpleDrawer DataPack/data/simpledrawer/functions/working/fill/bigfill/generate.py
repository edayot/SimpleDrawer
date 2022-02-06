import os


for i in range(0,36):
    try:
        os.mkdir("slot"+str(i))
    except:
        pass
    test="""data modify storage simpledrawer:temp ItemInventory set from entity @p[tag=simpledrawer.adder] Inventory[{Slot:"""+str(i)+"""b}]
data remove storage simpledrawer:temp ItemInventory.Count
data remove storage simpledrawer:temp ItemInventory.Slot
execute store success storage simpledrawer:temp bigfilltest byte 1 run data modify storage simpledrawer:temp ItemInventory set from storage simpledrawer:temp ItemDrawer
execute if data storage simpledrawer:temp {bigfilltest:0b} run function simpledrawer:working/fill/bigfill/slot"""+str(i)+"""/fill

    """
    fill="""execute store result score nbcrate simpledrawer.tempC run data get entity @s Item.tag.data.Count
execute store result score nbplayer simpledrawer.tempC run data get entity @p[tag=simpledrawer.adder] Inventory[{Slot:"""+str(i)+"""b}].Count
scoreboard players operation nbcrate simpledrawer.tempC += nbplayer simpledrawer.tempC 
execute if score nbcrate simpledrawer.tempC <= maxCount simpledrawer.tempC store result entity @s Item.tag.data.Count long 1 run scoreboard players get nbcrate simpledrawer.tempC 
execute if score nbcrate simpledrawer.tempC <= maxCount simpledrawer.tempC run item replace entity @p[tag=simpledrawer.adder] container."""+str(i)+""" with air

execute unless score nbcrate simpledrawer.tempC <= maxCount simpledrawer.tempC run function simpledrawer:working/fill/bigfill/slot"""+str(i)+"""/fullfill

    """
    fullfill="""data modify entity @s Item.tag.data.Count set from entity @s Item.tag.info.maxCount
scoreboard players operation nbcrate simpledrawer.tempC -= maxCount simpledrawer.tempC



item modify entity @p[tag=simpledrawer.adder] container."""+str(i)+""" simpledrawer:set_count

tag @s add simpledrawer.full

    """
    with open("slot"+str(i)+"/test.mcfunction","w") as f:
        f.write(test)
    with open("slot"+str(i)+"/fill.mcfunction","w") as f:
        f.write(fill)
    with open("slot"+str(i)+"/fullfill.mcfunction","w") as f:
        f.write(fullfill)

    