
import yaml
import requests
import json
import os
import sys
from requests_toolbelt.multipart.encoder import MultipartEncoder
import hashlib
import time
import toml

time.sleep(10)
MODRINTH_AUTH_TOKEN=os.environ["MODRINTH_AUTH_TOKEN"]

def get_sha512(file):
    sha512 = hashlib.sha512()
    with open(file,"rb") as f:
        for chunk in iter(lambda: f.read(4096), b""):
            sha512.update(chunk)
    return sha512.hexdigest()

def post_modrinth_version(data,files):
    return requests.post(
        "https://api.modrinth.com/v2/version",
        headers={
        "Authorization":MODRINTH_AUTH_TOKEN
        },
        data={
            "data":json.dumps(data)
        },
        files=files
    )



beet = toml.load("pyproject.toml")['tool']['beet']
poetry = toml.load("pyproject.toml")['tool']['poetry']


# get current version using poetry version command
command = f"poetry version | cut -d' ' -f2"
CURRENT_VERSION = os.popen(command).read().strip()
print("CURRENT_VERSION: " + CURRENT_VERSION)

release=requests.get(f"https://api.github.com/repos/edayot/{poetry['name']}/releases/tags/v{CURRENT_VERSION}").json()



data={
    "name":f"v{CURRENT_VERSION}",
    "version_number":CURRENT_VERSION,
    "changelog":release['body'],
    "dependencies":[],
    "game_versions":beet['meta']['mc_supports'],
    "version_type":"release",
    "loaders":["datapack"],
    "featured":True,
    "project_id":beet['meta']['modrinth_id'],
    "file_parts":[],
    "primary_file":"",
    "status":"listed"
}





# check if the directory exists
build="build"
bundled_datapack=False
for file in os.listdir(build):
    if "_bundled" in file:
        bundled_datapack=True
        break

files={}
for file in os.listdir(build):
    if "_bundled" in file or not bundled_datapack:
        data['file_parts'].append(file)

        with open(os.path.join(build,file),"rb") as f:
            files[file] = (file,f.read())

    if "_dp_bundled" in file or not bundled_datapack:
        data['primary_file']=file





#multipart/form-data
#The request is a multipart request with at least two form fields: one is data, which includes a JSON body with the version metadata as shown below, and at least one field containing an upload file.

#data = {"data":json.dumps(data)}




r=post_modrinth_version(data,files)
 
try:
    print(r.json())
except:
    print(r.text)

if r.status_code != 200:
    exit(1)




# Check hashes
files_modrinth=r.json()['files']

for file in files_modrinth:
    if file["hashes"]["sha512"] != get_sha512(os.path.join(build,file["filename"])):
        print(f"Hashes don't match for {file['filename']}")
    else:
        print(f"Hashes match for {file['filename']}")
            
# Modify the resource pack file_type to "required-resource-pack"