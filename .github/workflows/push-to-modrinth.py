
import yaml
import requests
import json
import os
import sys
from requests_toolbelt.multipart.encoder import MultipartEncoder



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


"""
files={}
for file in release['assets']:
    if "Bundled" in file['name']:
        data['file_parts'].append(file["name"])

        
        # get the file from github
        r=requests.get(file['browser_download_url'])
        if r.status_code != 200:
            print(f"Error downloading {file['name']}")
            exit(1)
        files[file['name']] = (file['name'],r.content)



    if "Datapack" in file['name'] and "Bundled" in file['name']:
        data['primary_file']=file["name"]
"""

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



payload=MultipartEncoder(fields=files)


#multipart/form-data
#The request is a multipart request with at least two form fields: one is data, which includes a JSON body with the version metadata as shown below, and at least one field containing an upload file.

#data = {"data":json.dumps(data)}




r=requests.post("https://api.modrinth.com/v2/version",
    headers={
        "Authorization":MODRINTH_AUTH_TOKEN
    },
    data={
        "data":json.dumps(data)
    },
    files=files
)
 
try:
    print(r.json())
except:
    print(r.text)

if r.status_code != 200:
    exit(1)
