
import os


#Get the git hash
git_hash = os.environ("GIT_HASH")


#Replace all __git_hash__ with the git hash in ../../beet-artifact.yaml
with open("../../beet-artifact.yaml", "r") as f:
    text = f.read()

text = text.replace("__git_hash__", git_hash)

with open("../../beet-artifact.yaml", "w") as f:
    f.write(text)



