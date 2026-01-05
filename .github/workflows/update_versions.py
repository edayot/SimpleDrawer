import yaml
import os
import json
import subprocess
from urllib.parse import urlencode


def run(cmd: str) -> None:
    """Run a shell command and exit with an error if it fails.

    This ensures the GitHub Actions job fails immediately on errors
    (e.g. failed git push).
    """
    print(f"Running: {cmd}")
    result = subprocess.run(cmd, shell=True, text=True, capture_output=True)

    # Print command output for easier debugging in CI logs
    if result.stdout:
        print(result.stdout, end="")
    if result.stderr:
        # Prefix stderr to make it stand out in logs
        print(result.stderr, end="")

    if result.returncode != 0:
        print(f"Command failed with exit code {result.returncode}: {cmd}")
        raise SystemExit(result.returncode)


# configure git
run("git config --global user.name \"github-actions\"")
run("git config --global user.email \"action@github.com\"")

with open("beet.yaml", "r") as f:
    beet = yaml.safe_load(f)

mc_supports = beet['meta']['mc_supports']

if len(mc_supports) > 1:
    version = mc_supports[0] + " - " + mc_supports[-1]
else:
    version = mc_supports[0]


github_repo = os.environ.get("GITHUB_REPOSITORY", "edayot/SimpleDrawer")
github_token = os.environ.get("GH_TOKEN")

if github_token:
    # Use authenticated URL so git push works in CI
    clone_url = f"https://x-access-token:{github_token}@github.com/{github_repo}.git"
else:
    # Fallback to unauthenticated clone (push will likely fail)
    clone_url = f"https://github.com/{github_repo}.git"

run(f"git clone -b versions {clone_url} versions")
with open("versions/versions.json", "w") as f:
    json.dump({
        "versions": version
    }, f)
run("cd versions && git add versions.json && git commit --allow-empty -m 'Update versions.json to {}' && git push origin versions".format(version))
# capture the last commit SHA from the cloned `versions` repo and set it in environment
sha = subprocess.check_output(["git", "-C", "versions", "rev-parse", "HEAD"]).decode().strip()
print("Captured versions commit SHA: {}".format(sha))


base_url = "https://img.shields.io/badge/dynamic/json"

params = {
    "url": f"https://raw.githubusercontent.com/edayot/SimpleDrawer/{sha}/versions.json",
    "query": "$.versions",
    "logo": "data:image/png;base64,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",
    "label": "Minecraft",
    "cacheSeconds": "60"
}
full_url = f"{base_url}?{urlencode(params)}"
markdown = f"![Minecraft version]({full_url})"


# make the SHA available to subsequent GitHub Actions steps
ghenv = os.environ.get("GITHUB_ENV")
if ghenv:
    try:
        with open(ghenv, "a") as f:
            f.write("VERSIONS_BADGE_URL={}\n".format(markdown))
        print("Wrote VERSIONS_BADGE_URL to GITHUB_ENV")
    except Exception as e:
        print("Failed to write to GITHUB_ENV:", e)

run("rm -rf versions")

print("Updated versions.json to {}".format(version))
