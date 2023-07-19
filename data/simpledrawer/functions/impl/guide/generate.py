# good syntax
#data modify storage simpledrawer:main ItemsNBT.guide.tag.pages append value '{"text":"aaa",hoverEvent:{action:"show_item",contents:{id:"minecraft:stick",tag:"{display:{Name:\'{\\"text\\":\\"coucou\\"}\'}}"}}}'


import json 
import dataclasses

@dataclasses.dataclass
class Item:
    str_repr: str
    # default -1 means no page
    page: int = -1
    # optional description
    description: str = ""
    # optional page title
    page_title: str = ""
    
def generate_page(craft,craft_result,craft_char="uff01",craft_result_char="uff02"):
    


    json_encode='["",'
    header='{"translate":"TTT","font":"simpledrawer:medium","color":"black"},{"text":"\\\\n\\\\XXX \\\\YYY\\\\n\\\\n","font":"simpledrawer:font","color":"white"},'
    header=header.replace("XXX",craft_char)
    header=header.replace("YYY",craft_result_char)

    if len(craft_result.page_title)>0:
        header=header.replace("TTT",craft_result.page_title)
    else:
        header=header.replace("TTT","")


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

    if len(craft_result.description)>0:
        description='{"translate":"XXX","color":"black","italic":false},'
        description=description.replace("XXX",craft_result.description)
        json_encode=json_encode+'"\\\\n",'+description

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

start_page=2

# heavy_workbench
string_item='{"id":"minecraft:furnace","tag":"{display:{Name:\\\'{\\\\\"translate\\\\\":\\\\\"block.smithed.crafter\\\\\",\\\\\"color\\\\\":\\\\\"white\\\\\",\\\\\"italic\\\\\":false}\\\'}}"}'
heavy_workbench=Item(string_item, start_page)
start_page=start_page+1
heavy_workbench.description="simpledrawer.guide.heavy_workbench"
heavy_workbench.page_title="block.smithed.crafter"

# new_drawer
string_item='{"id":"minecraft:furnace","tag":"{display:{Name:\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.new_drawer.empty\\\\\",\\\\\"color\\\\\":\\\\\"white\\\\\",\\\\\"italic\\\\\":false}\\\',Lore:[\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.name\\\\\",\\\\\"color\\\\\":\\\\\"blue\\\\\",\\\\\"italic\\\\\":true}\\\']}}"}'
new_drawer=Item(string_item, start_page)
start_page=start_page+1
new_drawer.description="simpledrawer.guide.new_drawer"
new_drawer.page_title="simpledrawer.new_drawer"

# drawer_page
start_page=start_page+1
start_page=start_page+1

# double_new_drawer
string_item='{"id":"minecraft:furnace","tag":"{display:{Name:\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.double_new_drawer.empty\\\\\",\\\\\"color\\\\\":\\\\\"white\\\\\",\\\\\"italic\\\\\":false}\\\',Lore:[\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.name\\\\\",\\\\\"color\\\\\":\\\\\"blue\\\\\",\\\\\"italic\\\\\":true}\\\']}}"}'
double_new_drawer=Item(string_item, start_page)
start_page=start_page+1
double_new_drawer.description="simpledrawer.guide.double_new_drawer"
double_new_drawer.page_title="simpledrawer.double_new_drawer"

# quadruple_new_drawer
string_item='{"id":"minecraft:furnace","tag":"{display:{Name:\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.quadruple_new_drawer.empty\\\\\",\\\\\"color\\\\\":\\\\\"white\\\\\",\\\\\"italic\\\\\":false}\\\',Lore:[\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.name\\\\\",\\\\\"color\\\\\":\\\\\"blue\\\\\",\\\\\"italic\\\\\":true}\\\']}}"}'
quadruple_new_drawer=Item(string_item, start_page)
start_page=start_page+1
quadruple_new_drawer.description="simpledrawer.guide.quadruple_new_drawer"
quadruple_new_drawer.page_title="simpledrawer.quadruple_new_drawer"


# upgrade_page
start_page=start_page+1

# hopper_upgrade
string_item='{"id":"minecraft:string","tag":"{display:{Name:\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.hopper_upgrade\\\\\",\\\\\"color\\\\\":\\\\\"white\\\\\",\\\\\"italic\\\\\":false}\\\',Lore:[\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.name\\\\\",\\\\\"color\\\\\":\\\\\"blue\\\\\",\\\\\"italic\\\\\":true}\\\']}}"}'
hopper_upgrade=Item(string_item, start_page)
start_page=start_page+1
hopper_upgrade.description="simpledrawer.guide.hopper_upgrade"
hopper_upgrade.page_title="simpledrawer.hopper_upgrade"
# iron_upgrade
string_item='{"id":"minecraft:jigsaw","tag":"{display:{Name:\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.iron_upgrade\\\\\",\\\\\"color\\\\\":\\\\\"white\\\\\",\\\\\"italic\\\\\":false}\\\',Lore:[\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.name\\\\\",\\\\\"color\\\\\":\\\\\"blue\\\\\",\\\\\"italic\\\\\":true}\\\']}}"}'
iron_upgrade=Item(string_item, start_page)
start_page=start_page+1
iron_upgrade.description="simpledrawer.guide.iron_upgrade"
iron_upgrade.page_title="simpledrawer.iron_upgrade"
# gold_upgrade
string_item='{"id":"minecraft:jigsaw","tag":"{display:{Name:\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.gold_upgrade\\\\\",\\\\\"color\\\\\":\\\\\"white\\\\\",\\\\\"italic\\\\\":false}\\\',Lore:[\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.name\\\\\",\\\\\"color\\\\\":\\\\\"blue\\\\\",\\\\\"italic\\\\\":true}\\\']}}"}'
gold_upgrade=Item(string_item, start_page)
start_page=start_page+1
gold_upgrade.description="simpledrawer.guide.gold_upgrade"
gold_upgrade.page_title="simpledrawer.gold_upgrade"
# diamond_upgrade
string_item='{"id":"minecraft:jigsaw","tag":"{display:{Name:\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.diamond_upgrade\\\\\",\\\\\"color\\\\\":\\\\\"white\\\\\",\\\\\"italic\\\\\":false}\\\',Lore:[\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.name\\\\\",\\\\\"color\\\\\":\\\\\"blue\\\\\",\\\\\"italic\\\\\":true}\\\']}}"}'
diamond_upgrade=Item(string_item, start_page)
start_page=start_page+1
diamond_upgrade.description="simpledrawer.guide.diamond_upgrade"
diamond_upgrade.page_title="simpledrawer.diamond_upgrade"
# star_upgrade
string_item='{"id":"minecraft:jigsaw","tag":"{display:{Name:\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.star_upgrade\\\\\",\\\\\"color\\\\\":\\\\\"white\\\\\",\\\\\"italic\\\\\":false}\\\',Lore:[\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.name\\\\\",\\\\\"color\\\\\":\\\\\"blue\\\\\",\\\\\"italic\\\\\":true}\\\']}}"}'
star_upgrade=Item(string_item, start_page)
start_page=start_page+1
star_upgrade.description="simpledrawer.guide.star_upgrade"
star_upgrade.page_title="simpledrawer.star_upgrade"
# netherite_upgrade
string_item='{"id":"minecraft:jigsaw","tag":"{display:{Name:\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.netherite_upgrade\\\\\",\\\\\"color\\\\\":\\\\\"white\\\\\",\\\\\"italic\\\\\":false}\\\',Lore:[\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.name\\\\\",\\\\\"color\\\\\":\\\\\"blue\\\\\",\\\\\"italic\\\\\":true}\\\']}}"}'
netherite_upgrade=Item(string_item, start_page)
start_page=start_page+1
netherite_upgrade.description="simpledrawer.guide.netherite_upgrade"
netherite_upgrade.page_title="simpledrawer.netherite_upgrade"

# downgrade_wrench
string_item='{"id":"minecraft:jigsaw","tag":"{display:{Name:\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.downgrade_wrench\\\\\",\\\\\"color\\\\\":\\\\\"white\\\\\",\\\\\"italic\\\\\":false}\\\',Lore:[\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.name\\\\\",\\\\\"color\\\\\":\\\\\"blue\\\\\",\\\\\"italic\\\\\":true}\\\']}}"}'
downgrade_wrench=Item(string_item, start_page)
start_page=start_page+1
downgrade_wrench.description="simpledrawer.guide.downgrade_wrench"
downgrade_wrench.page_title="simpledrawer.downgrade_wrench"

# guide
string_item='{"id":"minecraft:book","tag":"{display:{Name:\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.guide\\\\\",\\\\\"color\\\\\":\\\\\"white\\\\\",\\\\\"italic\\\\\":false}\\\',Lore:[\\\'{\\\\\"translate\\\\\":\\\\\"simpledrawer.name\\\\\",\\\\\"color\\\\\":\\\\\"blue\\\\\",\\\\\"italic\\\\\":true}\\\']}}"}'
guide=Item(string_item, start_page)
start_page=start_page+1
guide.description="simpledrawer.guide.guide"
guide.page_title="simpledrawer.guide"


commands=[]

#First page

first_page='["",'
first_page=first_page+'{"translate":"simpledrawer.guide_first","font":"simpledrawer:big","color":"black","bold":true},'
first_page=first_page+'{"text":"\\\\n      \\\\uee00\\\\n\\\\n\\\\n\\\\n\\\\n\\\\n\\\\n","font":"simpledrawer:font","color":"white"},'
first_page=first_page+'{"translate":"simpledrawer.guide.first_page","color":"black"}]'

commands.append(f"data modify storage simpledrawer:main ItemsNBT.guide.tag.pages append value '{first_page}'")


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

### Drawer page
drawer_page='["",{"translate":"simpledrawer.drawers","font":"simpledrawer:big","color":"black"},{"text":"\\\\n\\\\n","font":"simpledrawer:big","color":"black"}'
drawer_page=drawer_page+',{"translate":"simpledrawer.guide.drawers.inserting_title","color":"black","font":"simpledrawer:medium"}'
drawer_page=drawer_page+',{"translate":"simpledrawer.guide.drawers.inserting","color":"black"}'
drawer_page=drawer_page+']'
commands.append(f"data modify storage simpledrawer:main ItemsNBT.guide.tag.pages append value '{drawer_page}'")

drawer_page='["",{"translate":"simpledrawer.drawers","font":"simpledrawer:big","color":"black"},{"text":"\\\\n\\\\n","font":"simpledrawer:big","color":"black"}'
drawer_page=drawer_page+',{"translate":"simpledrawer.guide.drawers.extracting_title","color":"black","font":"simpledrawer:medium"}'
drawer_page=drawer_page+',{"translate":"simpledrawer.guide.drawers.extracting","color":"black"}'
drawer_page=drawer_page+']'
commands.append(f"data modify storage simpledrawer:main ItemsNBT.guide.tag.pages append value '{drawer_page}'")



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

### Upgrade page
upgrade_page='["",{"translate":"simpledrawer.upgrades","font":"simpledrawer:big","color":"black"},{"text":"\\\\n\\\\n\\\\n","font":"simpledrawer:big","color":"black"},{"translate":"simpledrawer.guide.upgrade","color":"black"}]'
commands.append(f"data modify storage simpledrawer:main ItemsNBT.guide.tag.pages append value '{upgrade_page}'")

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




