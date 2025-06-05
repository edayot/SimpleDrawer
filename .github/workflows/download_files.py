import os
import requests

def get_modrinth_url(project_id, version_id):
    # https://api.modrinth.com/v2/project/{id|slug}/version/{id|number}
    r = requests.get(f"https://api.modrinth.com/v2/project/{project_id}/version/{version_id}")
    r.raise_for_status()
    return r.json()["files"][0]["url"]

def download_file(url, path):
    r = requests.get(url)
    r.raise_for_status()
    os.makedirs(os.path.dirname(path), exist_ok=True)
    with open(path, "wb") as f:
        f.write(r.content)

MINECRAFT_VERSION = os.getenv("MINECRAFT_VERSION")
FABRIC_LOADER_VERSION = os.getenv("FABRIC_LOADER_VERSION")
PACKTEST_VERSION = os.getenv("PACKTEST_VERSION")
FABRIC_API_VERSION = os.getenv("FABRIC_API_VERSION")
INSTALLER_VERSION = os.getenv("INSTALLER_VERSION")

fabric_serv_url = (
    "https://meta.fabricmc.net/v2/versions/loader/"
    f"{MINECRAFT_VERSION}/"
    f"{FABRIC_LOADER_VERSION}/"
    f"{INSTALLER_VERSION}/server/jar"
)
fabric_api_url = get_modrinth_url("fabric-api", FABRIC_API_VERSION)
packtest_url = get_modrinth_url("packtest", PACKTEST_VERSION)

download_file(fabric_serv_url, f"./server.jar")
download_file(fabric_api_url, f"./mods/fabric-api.jar")
download_file(packtest_url, f"./mods/packtest.jar")


