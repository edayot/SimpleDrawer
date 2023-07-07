

# good syntax
#data modify storage simpledrawer:main ItemsNBT.guide.tag.pages append value '{"text":"aaa",hoverEvent:{action:"show_item",contents:{id:"minecraft:stick",tag:"{display:{Name:\'{\\"text\\":\\"coucou\\"}\'}}"}}}'


import json 
import dataclasses

@dataclasses.dataclass
class Item:
    str_repr: str
    # default -1 means no page
    page: int = -1
    
def generate_page(craft,craft_result,craft_char="uff01",craft_result_char="uff02"):
    


    json_encode='["",'
    header='{"text":"\\\\XXX \\\\YYY\\\\n\\\\n","font":"simpledrawer:font","color":"white"},'
    header=header.replace("XXX",craft_char)
    header=header.replace("YYY",craft_result_char)
    json_encode=json_encode+header



    # nb charactere par ligne = 38
    # nb ligne par page = 6

    for i in range(6):
        real_i=i//2
        line='{"text":"\\\\uef00\\\\uef00","font":"simpledrawer:font","color":"white"},'
        for j in range(3):
            if craft[real_i][j] != vide:
                if craft[real_i][j].page==-1:
                    item='{"text":"\\\\uef01","font":"simpledrawer:font","color":"white","hoverEvent":{"action":"show_item","contents":XXX}},'
                    item=item.replace("XXX",craft[real_i][j].str_repr)
                else:
                    item='{"text":"\\\\uef01","font":"simpledrawer:font","color":"white","hoverEvent":{"action":"show_item","contents":XXX},"clickEvent":{"action":"change_page","value":"YYY"}},'
                    item=item.replace("XXX",craft[real_i][j].str_repr)
                    item=item.replace("YYY",str(craft[real_i][j].page))
            else:
                item='{"text":"\\\\uef01","font":"simpledrawer:font","color":"white"},'
            line=line+item

        if not i in [1,2,3,4]:
            json_encode=json_encode+line+'"\\\\n",'
        else:
            space='{"text":"\\\\uef00\\\\uef00\\\\uef00\\\\uef00","font":"simpledrawer:font","color":"white"},'
            result='{"text":"\\\\uef02\\\\uef02","font":"simpledrawer:font","color":"white","hoverEvent":{"action":"show_item","contents":XXX},"clickEvent":{"action":"change_page","value":"YYY"}},'
            result=result.replace("XXX",craft_result.str_repr)
            result=result.replace("YYY",str(craft_result.page))
            json_encode=json_encode+line+space+result+'"\\\\n",'

    json_encode=json_encode[:-1]+"]"

    return f"data modify storage simpledrawer:main ItemsNBT.guide.tag.pages append value '{json_encode}'"


vide=Item('{"id":"minecraft:air"}', -1)
# All items
stick=Item('{"id":"minecraft:stick"}', -1)
barrel=Item('{"id":"minecraft:barrel"}', -1)
oak_planks=Item('{"id":"minecraft:oak_planks"}', -1)
iron_nugget=Item('{"id":"minecraft:iron_nugget"}', -1)
iron_ingot=Item('{"id":"minecraft:iron_ingot"}', -1)
diamond=Item('{"id":"minecraft:diamond"}', -1)
nether_star=Item('{"id":"minecraft:nether_star"}', -1)
netherite_ingot=Item('{"id":"minecraft:netherite_ingot"}', -1)
redstone=Item('{"id":"minecraft:redstone"}', -1)
hopper=Item('{"id":"minecraft:hopper"}', -1)
crafting_table=Item('{"id":"minecraft:crafting_table"}', -1)
oak_log=Item('{"id":"minecraft:oak_log"}', -1)
smooth_stone=Item('{"id":"minecraft:smooth_stone"}', -1)
gold_ingot=Item('{"id":"minecraft:gold_ingot"}', -1)
book=Item('{"id":"minecraft:book"}', -1)
chest=Item('{"id":"minecraft:chest"}', -1)

# All custom items

# heavy_workbench
string_item='{"id":"minecraft:furnace","tag":"{display:{Name:\\\'{\\\\\"translate\\\\\":\\\\\"block.smithed.crafter\\\\\",\\\\\"color\\\\\":\\\\\"white\\\\\",\\\\\"italic\\\\\":false}\\\'}}"}'
heavy_workbench=Item(string_item, 2)

# new_drawer
string_item='{"id":"minecraft:furnace","tag":"{display:{Name:\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.new_drawer.empty\\\\\",\\\\\"color\\\\\":\\\\\"white\\\\\",\\\\\"italic\\\\\":false}\\\',Lore:[\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.name\\\\\",\\\\\"color\\\\\":\\\\\"blue\\\\\",\\\\\"italic\\\\\":true}\\\']}}"}'
new_drawer=Item(string_item, 3)

# double_new_drawer
string_item='{"id":"minecraft:furnace","tag":"{display:{Name:\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.double_new_drawer.empty\\\\\",\\\\\"color\\\\\":\\\\\"white\\\\\",\\\\\"italic\\\\\":false}\\\',Lore:[\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.name\\\\\",\\\\\"color\\\\\":\\\\\"blue\\\\\",\\\\\"italic\\\\\":true}\\\']}}"}'
double_new_drawer=Item(string_item, 4)

# quadruple_new_drawer
string_item='{"id":"minecraft:furnace","tag":"{display:{Name:\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.quadruple_new_drawer.empty\\\\\",\\\\\"color\\\\\":\\\\\"white\\\\\",\\\\\"italic\\\\\":false}\\\',Lore:[\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.name\\\\\",\\\\\"color\\\\\":\\\\\"blue\\\\\",\\\\\"italic\\\\\":true}\\\']}}"}'
quadruple_new_drawer=Item(string_item, 5)


# hopper_upgrade
string_item='{"id":"minecraft:string","tag":"{display:{Name:\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.hopper_upgrade\\\\\",\\\\\"color\\\\\":\\\\\"white\\\\\",\\\\\"italic\\\\\":false}\\\',Lore:[\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.name\\\\\",\\\\\"color\\\\\":\\\\\"blue\\\\\",\\\\\"italic\\\\\":true}\\\']}}"}'
hopper_upgrade=Item(string_item, 6)
# iron_upgrade
string_item='{"id":"minecraft:jigsaw","tag":"{display:{Name:\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.iron_upgrade\\\\\",\\\\\"color\\\\\":\\\\\"white\\\\\",\\\\\"italic\\\\\":false}\\\',Lore:[\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.name\\\\\",\\\\\"color\\\\\":\\\\\"blue\\\\\",\\\\\"italic\\\\\":true}\\\']}}"}'
iron_upgrade=Item(string_item, 7)
# gold_upgrade
string_item='{"id":"minecraft:jigsaw","tag":"{display:{Name:\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.gold_upgrade\\\\\",\\\\\"color\\\\\":\\\\\"white\\\\\",\\\\\"italic\\\\\":false}\\\',Lore:[\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.name\\\\\",\\\\\"color\\\\\":\\\\\"blue\\\\\",\\\\\"italic\\\\\":true}\\\']}}"}'
gold_upgrade=Item(string_item, 8)
# diamond_upgrade
string_item='{"id":"minecraft:jigsaw","tag":"{display:{Name:\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.diamond_upgrade\\\\\",\\\\\"color\\\\\":\\\\\"white\\\\\",\\\\\"italic\\\\\":false}\\\',Lore:[\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.name\\\\\",\\\\\"color\\\\\":\\\\\"blue\\\\\",\\\\\"italic\\\\\":true}\\\']}}"}'
diamond_upgrade=Item(string_item, 9)
# star_upgrade
string_item='{"id":"minecraft:jigsaw","tag":"{display:{Name:\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.star_upgrade\\\\\",\\\\\"color\\\\\":\\\\\"white\\\\\",\\\\\"italic\\\\\":false}\\\',Lore:[\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.name\\\\\",\\\\\"color\\\\\":\\\\\"blue\\\\\",\\\\\"italic\\\\\":true}\\\']}}"}'
star_upgrade=Item(string_item, 10)
# netherite_upgrade
string_item='{"id":"minecraft:jigsaw","tag":"{display:{Name:\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.netherite_upgrade\\\\\",\\\\\"color\\\\\":\\\\\"white\\\\\",\\\\\"italic\\\\\":false}\\\',Lore:[\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.name\\\\\",\\\\\"color\\\\\":\\\\\"blue\\\\\",\\\\\"italic\\\\\":true}\\\']}}"}'
netherite_upgrade=Item(string_item, 11)

# downgrade_wrench
string_item='{"id":"minecraft:jigsaw","tag":"{display:{Name:\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.downgrade_wrench\\\\\",\\\\\"color\\\\\":\\\\\"white\\\\\",\\\\\"italic\\\\\":false}\\\',Lore:[\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.name\\\\\",\\\\\"color\\\\\":\\\\\"blue\\\\\",\\\\\"italic\\\\\":true}\\\']}}"}'
downgrade_wrench=Item(string_item, 12)

# guide
string_item='{"id":"minecraft:book","tag":"{display:{Name:\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.guide\\\\\",\\\\\"color\\\\\":\\\\\"white\\\\\",\\\\\"italic\\\\\":false}\\\',Lore:[\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.name\\\\\",\\\\\"color\\\\\":\\\\\"blue\\\\\",\\\\\"italic\\\\\":true}\\\']}}"}'
guide=Item(string_item, 13)


commands=[]

# heavy_workbench
craft=[
    [oak_log, oak_log, oak_log],
    [oak_log, crafting_table, oak_log],
    [smooth_stone, smooth_stone, smooth_stone]
]
craft_result=heavy_workbench

commands.append(generate_page(craft, craft_result,"uff03","uff04"))

# new_drawer
craft=[
    [oak_planks, stick, oak_planks],
    [stick, iron_nugget, stick],
    [oak_planks, barrel, oak_planks]
]
craft_result=new_drawer

commands.append(generate_page(craft, craft_result,"uff05","uff06"))

# double_new_drawer
craft=[
    [oak_planks, barrel, oak_planks],
    [stick, iron_nugget, stick],
    [oak_planks, barrel, oak_planks]
]
craft_result=double_new_drawer

commands.append(generate_page(craft, craft_result,"uff07","uff08"))

# quadruple_new_drawer
craft=[
    [oak_planks, barrel, oak_planks],
    [barrel, iron_nugget, barrel],
    [oak_planks, barrel, oak_planks]
]
craft_result=quadruple_new_drawer

commands.append(generate_page(craft, craft_result,"uff09","uff0a"))

#hoppper_upgrade
craft=[
    [stick, stick, stick],
    [hopper, iron_upgrade, hopper],
    [redstone, vide, redstone]
]
craft_result=hopper_upgrade

commands.append(generate_page(craft, craft_result,"uff0b","uff0c"))

#iron_upgrade
craft=[
    [stick, stick, stick],
    [iron_ingot, oak_planks, iron_ingot],
    [iron_ingot, oak_planks, iron_ingot]
]
craft_result=iron_upgrade

commands.append(generate_page(craft, craft_result,"uff0d","uff0e"))

#gold_upgrade
craft=[
    [stick, stick, stick],
    [gold_ingot, iron_upgrade, gold_ingot],
    [gold_ingot, vide, gold_ingot]
]
craft_result=gold_upgrade

commands.append(generate_page(craft, craft_result,"uff0f","uff10"))

#diamond_upgrade
craft=[
    [stick, stick, stick],
    [diamond, gold_upgrade, diamond],
    [diamond, vide, diamond]
]
craft_result=diamond_upgrade

commands.append(generate_page(craft, craft_result,"uff11","uff12"))

#star_upgrade
craft=[
    [stick, diamond, stick],
    [iron_ingot, diamond_upgrade, iron_ingot],
    [iron_ingot, nether_star, iron_ingot]
]
craft_result=star_upgrade

commands.append(generate_page(craft, craft_result,"uff13","uff14"))

#netherite_upgrade
craft=[
    [nether_star, nether_star, nether_star],
    [netherite_ingot, star_upgrade, netherite_ingot],
    [netherite_ingot, netherite_ingot, netherite_ingot]
]
craft_result=netherite_upgrade

commands.append(generate_page(craft, craft_result,"uff15","uff16"))

#downgrade_wrench
craft=[
    [vide, iron_nugget, iron_upgrade],
    [vide, iron_ingot, iron_nugget],
    [iron_ingot, vide, vide]
]
craft_result=downgrade_wrench

commands.append(generate_page(craft, craft_result,"uff17","uff18"))

#guide
craft=[
    [barrel, iron_nugget, vide],
    [book, oak_planks, vide],
    [vide, vide, vide]
]
craft_result=guide

commands.append(generate_page(craft, craft_result,"uff19","uff1a"))

    

with open("generate.mcfunction","w") as f:
    for command in commands:
        f.write(command+"\n")




