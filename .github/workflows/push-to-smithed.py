import json
import os
from typing import Any

import requests
import yaml

print("Hello World")
print(os.environ["SMITHED_UID"])
print(os.environ("CURRENT_VERSION"))

"""
try:
	uid=os.environ["SMITHED_UID"]
	token=os.environ["SMITHED_TOKEN"]
	current_version = os.environ("CURRENT_VERSION")
except:
	uid="UID"
	token="TOKEN"
	current_version="1.0.0"


post_url = (
    "https://api.smithed.dev/addUserPackVersion?"
    f"uid={uid}"
    "&pack={pack}"
    "&version={version}"
    f"&token={token}"
)
download_url = (
	"https://github.com/edayot/"
	"{name}/releases/download/{current_version}/{name}-{current_version}-{type}.zip?raw=true"
)

headers = {"Content-Type": "application/json"}

payload: Any ={
        "name": "",
        "breaking": False,
        "downloads": {"datapack": ""},
        "supports": [],
        "dependencies": [],
    }



# Post to smithed

beet = yaml.safe_load(open("../../beet.yaml"))


payload["name"] = current_version

payload["downloads"]["datapack"] = download_url.format(
        name=beet["name"],
        current_version=current_version,
        type="Datapack",
    )
if "resource_pack" in beet:
	payload["downloads"]["resourcepack"] = download_url.format(
        name=beet["name"],
        current_version=current_version,
        type="Resourcepack",
    )

payload["supports"] = ["1.19"]

payload["dependencies"] = [
	{"id": f"{dependency}", "version": version}
	for dependency, version in beet.get("meta", {}).get("smithed_dependencies", {}).items()
]

pack = beet["id"]
version = current_version

resp = requests.post(
	url=post_url.format(pack=pack, version=version),
	headers={"Content-Type": "application/json"},
	data=json.dumps({"data": payload}),
)

if resp.status_code != 200:
	print(f"{resp.status_code=} ⚠️ UPLOAD ERROR ⚠️")
	print(f"{pack=} {version=}")
	print(f"{payload=}")

"""