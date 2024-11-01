

import os
import json



# pour i de 1430000 à 1430005
# pour j allant de 0.143000 à 0.143010

# si j=0.143000 alors material=oak
# si j=0.143001 alors material=spruce
# si j=0.143002 alors material=birch
# si j=0.143003 alors material=jungle
# si j=0.143004 alors material=acacia
# si j=0.143005 alors material=dark_oak
# si j=0.143006 alors material=mangrove
# si j=0.143007 alors material=cherry
# si j=0.143008 alors material=crimson
# si j=0.143009 alors material=warped
# si j=0.143010 alors material=bamboo
# si j=0.143011 alors material=ice

# si i=1430000 alors drawer_type=1
# si i=1430001 alors drawer_type=2
# si i=1430002 alors drawer_type=4
# si i=1430003 alors drawer_type=1_tapped
# si i=1430004 alors drawer_type=2_tapped
# si i=1430005 alors drawer_type=4_tapped

d={
    0:"oak",
    1:"spruce",
    2:"birch",
    3:"jungle",
    4:"acacia",
    5:"dark_oak",
    6:"mangrove",
    7:"cherry",
    8:"crimson",
    9:"warped",
    10:"bamboo",
    12:"ice",
}

d2={
    1430000:"1",
    1430001:"2",
    1430002:"4",
    1430003:"1_tapped",
    1430004:"2_tapped",
    1430005:"4_tapped"
}






with open("furnace_init.json","r") as f:
    data=json.load(f)

for i in range(1430000,1430006):
    for j in range(0,13,1):
        if j==11:
            continue
        j_=0.143000+j/10**6
        material=d[j]
        drawer_type=d2[i]
        default={
            "predicate":{
                "custom_model_data":i,
                "trim_type":j_
                },
            "model":"simpledrawer:item/new_drawer/"+material+"_"+drawer_type
        }
        data["overrides"].append(default)

with open("furnace.json","w") as f:
    json.dump(data,f,indent=4)



