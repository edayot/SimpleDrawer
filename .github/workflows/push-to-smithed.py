


import requests
import json
import os
import sys
import toml
import yaml
from weld_deps.main import DepsConfig, Source

try: 
    SMITHED_TOKEN = os.environ['SMITHED_TOKEN']
except KeyError:
    print("SMITHED_TOKEN not found in environment variables")
    sys.exit(1)
with open("beet.yaml", "r") as f:
    beet = yaml.safe_load(f)

all_toml = toml.load("pyproject.toml")
project = all_toml["project"]

print(beet)

CURRENT_VERSION = project["version"]
print("CURRENT_VERSION: " + CURRENT_VERSION)



post_url = (
    "https://api.smithed.dev/v2/packs/"
    f'{project["name"]}/versions'
    f"?token={SMITHED_TOKEN}"
    f"&version={CURRENT_VERSION}"
)


download_url = (
    "https://github.com/edayot/"
    f'{project["name"]}/releases/download/'
    f"v{CURRENT_VERSION}/"
    f'{project["name"].replace("-","_")}_{CURRENT_VERSION}_'
    "{ziptype}.zip"
)



weld_deps = beet.get("meta", {}).get("weld_deps", {})
weld_deps = DepsConfig.model_validate(weld_deps)
dep = []
for id, version_param in weld_deps.deps_dict():
    dep.append({
        "id": id,
        "version": version_param.version
    })


pack_version = {
  "name": CURRENT_VERSION,
  "downloads": {},
  "supports": beet['meta']['mc_supports'],
  "dependencies": dep,
}

if "data_pack" in beet:
    pack_version["downloads"]["datapack"] = download_url.format(ziptype="dp")
else:
    pack_version["downloads"]["datapack"] = ""
if "resource_pack" in beet:
    pack_version["downloads"]["resourcepack"] = download_url.format(ziptype="rp")
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


if not response.ok:
    print("Error: " + response.text)
    sys.exit(1)