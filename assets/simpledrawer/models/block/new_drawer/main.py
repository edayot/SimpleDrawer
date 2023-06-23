import json
import os



# For all .json files in the current directory
for filename in os.listdir("."):
    if filename.endswith("_1.json") or filename.endswith("_2.json") or filename.endswith("_4.json"):
        # Open the file
        with open(filename, "r") as file:
            data=json.load(file)
        # Ajout de _tapped à la fin du nom du fichier
        filename_tapped=filename[:-5]+"_tapped.json"

        with open(filename_tapped, "w") as file:
            data["parent"]="simpledrawer:block/new_drawer/full_drawers_orientable_tapped"
            json.dump(data, file)
