import toml
import os
import json


mc_supports = toml.load("pyproject.toml")['tool']['beet']['meta']['mc_supports']

if len(mc_supports) > 1:
    version = mc_supports[0] + " - " + mc_supports[-1]
else:
    version = mc_supports[0]


os.system("git clone -b versions https://github.com/edayot/SimpleDrawer.git versions")
with open("versions/versions.json", "w") as f:
    json.dump({
        "versions": version
    }, f)
os.system("cd versions && git add versions.json && git commit -m 'Update versions.json to {}' && git push origin versions".format(version))
os.system("rm -rf versions")

print("Updated versions.json to {}".format(version))
