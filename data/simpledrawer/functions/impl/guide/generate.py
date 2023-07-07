

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
            if craft[real_i][j].page==-1:
                item='{"text":"\\\\uef01","font":"simpledrawer:font","color":"white","hoverEvent":{"action":"show_item","contents":XXX}},'
                item=item.replace("XXX",craft[real_i][j].str_repr)
            else:
                item='{"text":"\\\\uef01","font":"simpledrawer:font","color":"white","hoverEvent":{"action":"show_item","contents":XXX},"clickEvent":{"action":"change_page","value":"YYY"}},'
                item=item.replace("XXX",craft[real_i][j].str_repr)
                item=item.replace("YYY",str(craft[real_i][j].page))
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

# All custom items
# new_drawer
string_item='{"id":"minecraft:furnace","tag":"{display:{Name:\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.new_drawer.empty\\\\\",\\\\\"color\\\\\":\\\\\"white\\\\\",\\\\\"italic\\\\\":false}\\\',Lore:[\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.name\\\\\",\\\\\"color\\\\\":\\\\\"blue\\\\\",\\\\\"italic\\\\\":true}\\\']}}"}'
new_drawer=Item(string_item, 0)

# double_new_drawer
string_item='{"id":"minecraft:chest","tag":"{display:{Name:\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.double_new_drawer.empty\\\\\",\\\\\"color\\\\\":\\\\\"white\\\\\",\\\\\"italic\\\\\":false}\\\',Lore:[\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.name\\\\\",\\\\\"color\\\\\":\\\\\"blue\\\\\",\\\\\"italic\\\\\":true}\\\']}}"}'
double_new_drawer=Item(string_item, 1)

# quadruple_new_drawer
string_item='{"id":"minecraft:barrel","tag":"{display:{Name:\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.quadruple_new_drawer.empty\\\\\",\\\\\"color\\\\\":\\\\\"white\\\\\",\\\\\"italic\\\\\":false}\\\',Lore:[\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.name\\\\\",\\\\\"color\\\\\":\\\\\"blue\\\\\",\\\\\"italic\\\\\":true}\\\']}}"}'
quadruple_new_drawer=Item(string_item, 2)


# hopper_upgrade
string_item='{"id":"minecraft:string","tag":"{display:{Name:\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.hopper_upgrade\\\\\",\\\\\"color\\\\\":\\\\\"white\\\\\",\\\\\"italic\\\\\":false}\\\',Lore:[\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.name\\\\\",\\\\\"color\\\\\":\\\\\"blue\\\\\",\\\\\"italic\\\\\":true}\\\']}}"}'
hopper_upgrade=Item(string_item, 3)
# iron_upgrade
string_item='{"id":"minecraft:jigsaw","tag":"{display:{Name:\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.iron_upgrade\\\\\",\\\\\"color\\\\\":\\\\\"white\\\\\",\\\\\"italic\\\\\":false}\\\',Lore:[\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.name\\\\\",\\\\\"color\\\\\":\\\\\"blue\\\\\",\\\\\"italic\\\\\":true}\\\']}}"}'
iron_upgrade=Item(string_item, 4)
# gold_upgrade
string_item='{"id":"minecraft:jigsaw","tag":"{display:{Name:\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.gold_upgrade\\\\\",\\\\\"color\\\\\":\\\\\"white\\\\\",\\\\\"italic\\\\\":false}\\\',Lore:[\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.name\\\\\",\\\\\"color\\\\\":\\\\\"blue\\\\\",\\\\\"italic\\\\\":true}\\\']}}"}'
gold_upgrade=Item(string_item, 5)
# diamond_upgrade
string_item='{"id":"minecraft:jigsaw","tag":"{display:{Name:\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.diamond_upgrade\\\\\",\\\\\"color\\\\\":\\\\\"white\\\\\",\\\\\"italic\\\\\":false}\\\',Lore:[\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.name\\\\\",\\\\\"color\\\\\":\\\\\"blue\\\\\",\\\\\"italic\\\\\":true}\\\']}}"}'
diamond_upgrade=Item(string_item, 6)
# star_upgrade
string_item='{"id":"minecraft:jigsaw","tag":"{display:{Name:\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.star_upgrade\\\\\",\\\\\"color\\\\\":\\\\\"white\\\\\",\\\\\"italic\\\\\":false}\\\',Lore:[\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.name\\\\\",\\\\\"color\\\\\":\\\\\"blue\\\\\",\\\\\"italic\\\\\":true}\\\']}}"}'
star_upgrade=Item(string_item, 7)
# netherite_upgrade
string_item='{"id":"minecraft:jigsaw","tag":"{display:{Name:\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.netherite_upgrade\\\\\",\\\\\"color\\\\\":\\\\\"white\\\\\",\\\\\"italic\\\\\":false}\\\',Lore:[\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.name\\\\\",\\\\\"color\\\\\":\\\\\"blue\\\\\",\\\\\"italic\\\\\":true}\\\']}}"}'
netherite_upgrade=Item(string_item, 8)

# downgrade_wrench
string_item='{"id":"minecraft:stick","tag":"{display:{Name:\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.downgrade_wrench\\\\\",\\\\\"color\\\\\":\\\\\"white\\\\\",\\\\\"italic\\\\\":false}\\\',Lore:[\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.wrench_lore\\\\\",\\\\\"color\\\\\":\\\\\"gray\\\\\",\\\\\"italic\\\\\":true}\\\']}}"}'
downgrade_wrench=Item(string_item, 9)

# guide
string_item='{"id":"minecraft:book","tag":"{display:{Name:\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.guide\\\\\",\\\\\"color\\\\\":\\\\\"white\\\\\",\\\\\"italic\\\\\":false}\\\',Lore:[\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.guide_lore\\\\\",\\\\\"color\\\\\":\\\\\"gray\\\\\",\\\\\"italic\\\\\":true}\\\']}}"}'
guide=Item(string_item, 10)


commands=[]



# new_drawer
craft=[
    [oak_planks, stick, oak_planks],
    [stick, iron_nugget, stick],
    [oak_planks, barrel, oak_planks]
]
craft_result=new_drawer

commands.append(generate_page(craft, craft_result,"uff03","uff04"))

# double_new_drawer
craft=[
    [oak_planks, barrel, oak_planks],
    [stick, iron_nugget, stick],
    [oak_planks, barrel, oak_planks]
]
craft_result=double_new_drawer

commands.append(generate_page(craft, craft_result,"uff05","uff06"))

# quadruple_new_drawer
craft=[
    [oak_planks, barrel, oak_planks],
    [barrel, iron_nugget, barrel],
    [oak_planks, barrel, oak_planks]
]
craft_result=quadruple_new_drawer

commands.append(generate_page(craft, craft_result,"uff07","uff08"))



with open("generate.mcfunction","w") as f:
    for command in commands:
        f.write(command+"\n")




