


import yaml
import requests
import json
import os
import sys

try: 
    SMITHED_TOKEN = os.environ['SMITHED_TOKEN']
    beet = yaml.safe_load(open("beet.yaml"))
except KeyError:
    try:
        with open(".github/workflows/credentials.json", "r") as f:
            creds = json.load(f)
        SMITHED_TOKEN = creds['SMITHED_TOKEN']
        beet = yaml.safe_load(open("./beet.yaml"))
    except:
        print("Missing credentials")
        exit(1)


print(beet)

# get current version using poetry version command
command = f"poetry version | cut -d' ' -f2"
CURRENT_VERSION = os.popen(command).read().strip()
print("CURRENT_VERSION: " + CURRENT_VERSION)



post_url = (
    "https://api.smithed.dev/v2/packs/"
    f"{beet['id']}/versions"
    f"?token={SMITHED_TOKEN}"
    f"&version={CURRENT_VERSION}"
)


download_url = (
    "https://github.com/edayot/"
    f"{beet['name']}/releases/download/"
    f"v{CURRENT_VERSION}/"
    f"{beet['name']}-v{CURRENT_VERSION}-"
    "{ziptype}.zip"
)


dep = []

for d in beet["meta"]["weld_deps"]["deps"]:
    dep.append({
        "id":d["id"],
        "version":d["version"]
    })


pack_version = {
  "name": CURRENT_VERSION,
  "downloads": {},
  "supports": beet['meta']['mc_supports'],
  "dependencies": dep,
}

if "data_pack" in beet:
    pack_version["downloads"]["datapack"] = download_url.format(ziptype="Datapack")
else:
    pack_version["downloads"]["datapack"] = ""
if "resource_pack" in beet:
    pack_version["downloads"]["resourcepack"] = download_url.format(ziptype="Resourcepack")
else:
    pack_version["downloads"]["resourcepack"] = ""


response = requests.post(
    url=post_url,
    headers={"Content-Type": "application/json"},
    data=json.dumps({"data": pack_version})
)

print("PACK_VERSION:")
# print indented pack_version
print(json.dumps({"pack_version": pack_version}["pack_version"], indent=4))



# print response
print(f"RESPONSE: {response.status_code}")
print(response.text)


if not response.ok:
    print("Error: " + response.text)
    sys.exit(1)