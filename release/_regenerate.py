import os
import yaml
import requests

beet = yaml.safe_load(open("../beet.yaml"))

dep = beet['meta']['smithed_dependencies']

# Delete all .zip files in the current directory
for file in os.listdir("included"):
    if file.endswith(".zip"):
        os.remove(os.path.join("included", file))

download_url = ("https://api.smithed.dev/v2/download"
                "?pack={pack_id}@{pack_version}"
                "&mode={mode}"
)

for pack in dep:
    print(pack)
    pack_id = pack['id'].split(':')[1]
    pack_version = pack['version_']
    for mode in ["datapack", "resourcepack"]:
        url = download_url.format(pack_id=pack_id, pack_version=pack_version, mode=mode)
        # download the file at url and save it to the current directory
        r = requests.get(url)
        with open(f"included/{pack_id}-{pack_version}_{mode}.zip", "wb") as f:
            f.write(r.content)


