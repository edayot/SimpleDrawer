import json
import pathlib



path = pathlib.Path(__file__).parent

for file in path.glob("*.json"):
    if not "comp_" in file.name:
        continue
    new_name = file.name.replace("comp_", "comp_")
    file.rename(path / new_name)
