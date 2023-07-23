
import yaml
import requests
import json
import os
import sys
from requests_toolbelt.multipart.encoder import MultipartEncoder
import hashlib
import time

time.sleep(10)

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

try: 
    MODRINTH_AUTH_TOKEN=os.environ["MODRINTH_AUTH_TOKEN"]
except KeyError:
    try:
        with open("credentials.json", "r") as f:
            creds = json.load(f)
        MODRINTH_AUTH_TOKEN = creds['MODRINTH_AUTH_TOKEN']
    except:
        print("Missing credentials")
        exit(1)


try:
    beet = yaml.safe_load(open("beet.yaml"))
except FileNotFoundError:
    try:
        beet = yaml.safe_load(open("../../beet.yaml"))
    except FileNotFoundError:
        sys.exit(1,"beet.yaml not found")


release=requests.get(f"https://api.github.com/repos/edayot/{beet['name']}/releases/tags/v{beet['version']}").json()



data={
    "name":f"v{beet['version']}",
    "version_number":beet['version'],
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
if not os.path.isdir("build"):
    build="../../build"

files={}
for file in os.listdir(build):
    if "Bundled" in file:
        data['file_parts'].append(file)

        with open(os.path.join(build,file),"rb") as f:
            files[file] = (file,f.read())

    if "Datapack" in file and "Bundled" in file:
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

