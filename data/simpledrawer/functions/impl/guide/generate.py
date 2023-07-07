




import json 
import dataclasses

@dataclasses.dataclass
class Item:
    str_repr: str
    # default -1 means no page
    page: int = -1
    

stick=Item('{"id":"minecraft:stick"}', -1)
barrel=Item('{"id":"minecraft:barrel"}', -1)
oak_planks=Item('{"id":"minecraft:oak_planks"}', -1)
iron_nugget=Item('{"id":"minecraft:iron_nugget"}', -1)
vide=Item('{"id":"minecraft:air"}', -1)



craft=[
    [oak_planks, stick, oak_planks],
    [stick, iron_nugget, stick],
    [oak_planks, barrel, oak_planks]
]



craft_result_name='{"translate":"simpledrawer.new_drawer.empty","color":"white","italic":false}'
craft_result_lore='{"translate":"simpledrawer.name","color":"blue","italic":true}'

new_line='{"text":"\\\\n"},'

craft_result="["+craft_result_name+","+new_line+craft_result_lore+"]"

json_encode='["",'
json_encode=json_encode+'{"text":"\\\\uff01 \\\\uff02\\\\n\\\\n","font":"simpledrawer:font","color":"white","hoverEvent":{"action":"show_text","value":XXX}},'



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
        result='{"text":"\\\\uef02\\\\uef02","font":"simpledrawer:font","color":"white","hoverEvent":{"action":"show_text","contents":XXX}},'
        result=result.replace("XXX",craft_result)
        json_encode=json_encode+line+space+result+'"\\\\n",'




    


json_encode=json_encode[:-1]+"]"

with open("generate.mcfunction","w") as f:
    f.write(f"data modify storage simpledrawer:main ItemsNBT.guide2.tag.pages append value '{json_encode}'")
    f.write("\n\n\n")






