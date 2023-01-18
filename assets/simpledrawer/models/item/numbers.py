import json
from copy import deepcopy


index=["A","B","C","D","E","F","G"]
segments_7 = [
    [1,1,1,1,1,1,0],
    [0,1,1,0,0,0,0],
    [1,1,0,1,1,0,1],
    [1,1,1,1,0,0,1],
    [0,1,1,0,0,1,1],
    [1,0,1,1,0,1,1],
    [1,0,1,1,1,1,1],
    [1,1,1,0,0,0,0],
    [1,1,1,1,1,1,1],
    [1,1,1,1,0,1,1]
]


def delete_segments(model,segment_enabled,exponent):
    for i in range(0,7):
        if segment_enabled[i]==0:
            for k in range(0,len(model["elements"])):
                if model["elements"][k]["name"]==f"{index[i]}_{exponent}":
                    del model["elements"][k]
                    break
                    
        
#Load the base model numbers.json into a dictionary
with open("numbers.json","r") as f:
    base_model=json.load(f)


for i in range(0,1000):
    #Display all the segments except the first zeros
    model=deepcopy(base_model)
    #Decompose i into 3 digits
    digits=[0,0,0]
    digits[0]=i%10
    digits[1]=(i//10)%10
    digits[2]=(i//100)%10
    for exponent in range(2,-1,-1):
        delete_segments(model,segments_7[digits[exponent]],exponent)
    
    if digits[2]==0:
        delete_segments(model,[0,0,0,0,0,0,0],2)
        if digits[1]==0:
            delete_segments(model,[0,0,0,0,0,0,0],1)

        


    #Write the model to a file
    with open(f"numbers/{i}.json","w") as f:
        json.dump(model,f,indent=4)
        
