


import yaml
import requests
import json
import os

try: 
    SMITHED_UID = os.environ['SMITHED_UID']
    SMITHED_TOKEN = os.environ['SMITHED_TOKEN']
    beet = yaml.safe_load(open("beet.yaml"))
except KeyError:
    try:
        with open("credentials.json", "r") as f:
            creds = json.load(f)
        SMITHED_UID = creds['SMITHED_UID']
        SMITHED_TOKEN = creds['SMITHED_TOKEN']
        beet = yaml.safe_load(open("../../beet.yaml"))
    except:
        print("Missing credentials")
        exit(1)


print(beet)

CURRENT_VERSION=beet['version']



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

try:
    dep = beet['meta']['smithed_dependencies']
except KeyError:
    dep = []


pack_version = {
  "name": CURRENT_VERSION,
  "downloads": {},
  "supports": beet['supports'],
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
print("RESPONSE:")
print(response.text)
