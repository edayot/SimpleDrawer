



for wood_type in ["acacia","bamboo","birch","cherry","crimson","dark_oak","jungle","mangrove","spruce","warped"]:
    with open(f"{wood_type}.mcfunction","w") as f:
        f.write(f"""
data modify storage simpledrawer:main temp.ItemCraft.tag.Trim.material set value "simpledrawer:{wood_type}"
data modify storage simpledrawer:main temp.ItemCraft.tag.BlockEntityTag.Items[0].tag.simpledrawer.wood_type set value "simpledrawer:{wood_type}"






""")



