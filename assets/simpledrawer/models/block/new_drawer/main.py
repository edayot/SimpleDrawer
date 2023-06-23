import json
import os




# Parcours tout les fichiers json du dossier

def get_all_json_files(path):
    json_files = []
    for root, dirs, files in os.walk(path):
        for file in files:
            if file.endswith('.json'):
                json_files.append(os.path.join(root, file))
    return json_files

# Pour tout les fichiers json copier file["textures"]["front"] dans file["textures"]["particles"]
# et enregistrer le fichier

J=get_all_json_files(".")
for i in J:
    with open(i, "r") as f:
        file = json.load(f)
        print(file)
        # Avoid keyerror textures
        if "textures" in file:
            file["textures"]["particle"]=file["textures"]["front"]
            with open(i, "w") as f:
                json.dump(file, f, indent=4) 
        

