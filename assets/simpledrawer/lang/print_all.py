import json


with open("fr_fr.json", "r") as f:
    data = json.load(f)

for key in data:
    print(data[key])
