
import json
import copy

item=json.load(open("base.json",'r'))[0]
list=json.loads("[]")

r=range(-8,9)
all=[]
for x in r:
    for y in r:
        for z in r:
            if not (x,y,z) in all:
                all.append((x,y,z))
                item['tag']="{pos:["+str(x)+","+str(y)+","+str(z)+"]}"
                item["conditions"][0]["offsetX"]=x
                item["conditions"][0]["offsetY"]=y
                item["conditions"][0]["offsetZ"]=z
                list.append(copy.deepcopy(item))
    
with open("get_pos.json", "w") as outfile:
    json.dump(list, outfile)