import json
from copy import deepcopy
import os


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


def delete_suffix(model,suffix,h):
    for i in range(0,len(model["elements"])):
        if model["elements"][i]["name"] == f"{suffix}{h}":
            del model["elements"][i]
            return True

def delete_suffixes(model,suffix):
    for h in range(0,10):
        while delete_suffix(model,suffix,h):
            pass

def delete_segments(model,segment_enabled,exponent):
    for i in range(0,7):
        if segment_enabled[i]==0:
            for k in range(0,len(model["elements"])):
                if model["elements"][k]["name"]==f"{index[i]}_{exponent}":
                    del model["elements"][k]
                    break

def move_elements_to_type_display(model,type_display):
    if type_display=="int":
        return True
    elif type_display=="float_xx_x":
        move_element(model,0,[0,0,2])
    elif type_display=="float_x_xx":
        move_element(model,0,[0,0,2])
        move_element(model,1,[0,0,2])



def move_element(model,exponent,amount):
    for i in range(0,len(model["elements"])):
        if model["elements"][i]["name"] in [f"{letter}_{exponent}" for letter in ["A","B","C","D","E","F","G"]]:
            model["elements"][i]["from"][0]+=amount[0]
            model["elements"][i]["to"][0]+=amount[0]
            model["elements"][i]["from"][1]+=amount[1]
            model["elements"][i]["to"][1]+=amount[1]
            model["elements"][i]["from"][2]+=amount[2]
            model["elements"][i]["to"][2]+=amount[2]

def add_dot(model,type_display):
    if type_display=="int":
        return True
    elif type_display=="float_xx_x":
        model["elements"].append({
			"name": "dot_01",
			"from": [0, 0, 7],
			"to": [1, 1, 8],
			"faces": {
				"north": {"uv": [0, 0, 1, 1], "texture": "#0"},
				"east": {"uv": [0, 0, 1, 1], "texture": "#0"},
				"south": {"uv": [0, 0, 1, 1], "texture": "#0"},
				"west": {"uv": [0, 0, 1, 1], "texture": "#0"},
				"up": {"uv": [0, 0, 1, 1], "texture": "#0"},
				"down": {"uv": [0, 0, 1, 1], "texture": "#0"}
			}
		})
    elif type_display=="float_x_xx":
        model["elements"].append({
            "name": "dot_12",
            "from": [0, 0, 3],
            "to": [1, 1, 4],
            "faces": {
                "north": {"uv": [0, 0, 1, 1], "texture": "#0"},
                "east": {"uv": [0, 0, 1, 1], "texture": "#0"},
                "south": {"uv": [0, 0, 1, 1], "texture": "#0"},
                "west": {"uv": [0, 0, 1, 1], "texture": "#0"},
                "up": {"uv": [0, 0, 1, 1], "texture": "#0"},
                "down": {"uv": [0, 0, 1, 1], "texture": "#0"}
            }
        })


def generate_model(base_model,type_display,suffix,i):
    #Display all the segments except the first zeros
    model=deepcopy(base_model)
    #Decompose i into 3 digits
    digits=[0,0,0]
    digits[0]=i%10
    digits[1]=(i//10)%10
    digits[2]=(i//100)%10
    for exponent in range(2,-1,-1):
        delete_segments(model,segments_7[digits[exponent]],exponent)
    
    if digits[2]==0 and type_display!="float_xx_x":
        delete_segments(model,[0,0,0,0,0,0,0],2)
    if digits[2]==0 and digits[1]==0 and type_display!="float_xx_x":
        delete_segments(model,[0,0,0,0,0,0,0],1)

        
    #delete the suffix
    for suffix2 in ["no","k","M","G"]:
        if suffix2!=suffix:
            delete_suffixes(model,suffix2)
    
    #Move the elements to the right position
    move_elements_to_type_display(model,type_display)
    add_dot(model,type_display)                
    return model

def write_model(base_model,type_display,suffix,i):

    model = generate_model(base_model,type_display,suffix,i)
    #Write the model to a file
    try:
        os.mkdir("numbers")
    except:
        pass
    try:
        os.mkdir(f"numbers/{suffix}")
    except:
        pass
    try:
        os.mkdir(f"numbers/{suffix}/{type_display}")
    except:
        pass
    
    with open(f"numbers/{suffix}/{type_display}/{i}.json","w") as f:
        json.dump(model,f,indent=4)

#Load the base model numbers.json into a dictionary
with open("numbers.json","r") as f:
    base_model=json.load(f)



for type_display in ["int","float_x_xx","float_xx_x"]:
    for suffix in ["no","k","M","G"]:
        print(type_display,suffix)
        for i in range(0,1000):

            write_model(base_model,type_display,suffix,i)
            
