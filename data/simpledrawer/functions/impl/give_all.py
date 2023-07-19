


with open("give_all.mcfunction", "w") as f:
    t = ""
    for material in ["acacia","bamboo","birch","cherry","crimson","dark_oak","jungle","mangrove","spruce","warped","oak"]:
        t=t+f"""


data modify storage simpledrawer:main temp.ItemCraft set from storage simpledrawer:main ItemsNBT.new_drawer
data modify storage simpledrawer:main temp.ItemCraft.tag.Trim.material set value "simpledrawer:{material}"
data modify storage simpledrawer:main temp.ItemCraft.tag.BlockEntityTag.Items[0].tag.simpledrawer.wood_type set value "simpledrawer:{material}"
loot give @s loot simpledrawer:impl/items/new_drawer_craft
data modify storage simpledrawer:main temp.ItemCraft set from storage simpledrawer:main ItemsNBT.double_new_drawer
data modify storage simpledrawer:main temp.ItemCraft.tag.Trim.material set value "simpledrawer:{material}"
data modify storage simpledrawer:main temp.ItemCraft.tag.BlockEntityTag.Items[0].tag.simpledrawer.wood_type set value "simpledrawer:{material}"
loot give @s loot simpledrawer:impl/items/new_drawer_craft
data modify storage simpledrawer:main temp.ItemCraft set from storage simpledrawer:main ItemsNBT.quadruple_new_drawer
data modify storage simpledrawer:main temp.ItemCraft.tag.Trim.material set value "simpledrawer:{material}"
data modify storage simpledrawer:main temp.ItemCraft.tag.BlockEntityTag.Items[0].tag.simpledrawer.wood_type set value "simpledrawer:{material}"
loot give @s loot simpledrawer:impl/items/new_drawer_craft


"""

    f.write(t)