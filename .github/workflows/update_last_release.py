#!/usr/bin/env python3
"""Update CHANGELOG.md and patch the latest GitHub release.

Replaces the exact marker <!-- badge --> with the content of the
environment variable `VERSIONS_BADGE_URL` in both `CHANGELOG.md` and the
latest GitHub release body. Commits and pushes the change back to the
repository using the `GITHUB_TOKEN` available in the environment.

This script is intended to be run inside GitHub Actions where the
following environment variables are available:
- `VERSIONS_BADGE_URL` (required)
- `GITHUB_TOKEN` (required to update releases / push)
- `GITHUB_REPOSITORY` (owner/repo, automatically set by Actions)

If anything can't be completed the script exits with a non-zero code.
"""
import json
import os
import subprocess
import sys
from urllib import request, parse, error


def eprint(*args, **kwargs):
    print(*args, file=sys.stderr, **kwargs)


def getenv_or_exit(name):
    v = os.environ.get(name)
    if not v:
        eprint(f"Required environment variable '{name}' is not set")
        sys.exit(2)
    return v


def replace_in_file(path, marker, replacement):
    try:
        with open(path, "r", encoding="utf-8") as f:
            content = f.read()
    except FileNotFoundError:
        eprint(f"File not found: {path}")
        return False

    if marker not in content:
        eprint(f"Marker '{marker}' not found in {path}; skipping replace")
        return False

    new_content = content.replace(marker, replacement)
    with open(path, "w", encoding="utf-8") as f:
        f.write(new_content)
    print(f"Updated {path}")
    return True


def run_git_commit_and_push(files, message):
    # Configure git user
    subprocess.run(["git", "config", "user.name", "github-actions"], check=False)
    subprocess.run(["git", "config", "user.email", "action@github.com"], check=False)

    # Stage files
    subprocess.run(["git", "add"] + files, check=True)

    # Commit (allow empty commit to fail gracefully)
    try:
        subprocess.run(["git", "commit", "-m", message], check=True)
    except subprocess.CalledProcessError:
        eprint("No changes to commit or commit failed")
        return False

    # Push using token if available (the Actions runner already has remote set)
    try:
        subprocess.run(["git", "push"], check=True)
    except subprocess.CalledProcessError as e:
        eprint("Failed to push changes:", e)
        return False

    print("Pushed changes to remote")
    return True


def github_api_request(method, url, token, data=None):
    headers = {
        "Authorization": f"token {token}",
        "Accept": "application/vnd.github+json",
        "X-GitHub-Api-Version": "2022-11-28",
    }
    if data is not None:
        body = json.dumps(data).encode("utf-8")
        headers["Content-Type"] = "application/json"
    else:
        body = None

    req = request.Request(url, data=body, headers=headers, method=method)
    try:
        with request.urlopen(req) as resp:
            resp_body = resp.read().decode("utf-8")
            try:
                return resp.getcode(), json.loads(resp_body)
            except Exception:
                return resp.getcode(), resp_body
    except error.HTTPError as e:
        try:
            resp_body = e.read().decode("utf-8")
            return e.code, json.loads(resp_body)
        except Exception:
            eprint(f"HTTPError {e.code} when calling {url}")
            return e.code, None
    except Exception as e:
        eprint(f"Request error calling {url}: {e}")
        return None, None


def update_latest_release_badge(repo, token, marker, replacement):
    owner_repo = repo
    api_root = f"https://api.github.com/repos/{owner_repo}"
    latest_url = f"{api_root}/releases/latest"

    code, body = github_api_request("GET", latest_url, token)
    if code != 200:
        eprint(f"Failed to fetch latest release: HTTP {code} - {body}")
        return False

    release_id = body.get("id")
    if not release_id:
        eprint("Latest release has no id")
        return False

    current_body = body.get("body") or ""
    if marker not in current_body:
        eprint("Marker not found in latest release body; updating anyway by appending badge")
        new_body = current_body + "\n" + replacement
    else:
        new_body = current_body.replace(marker, replacement)

    patch_url = f"{api_root}/releases/{release_id}"
    patch_data = {"body": new_body}
    code2, body2 = github_api_request("PATCH", patch_url, token, data=patch_data)
    if code2 and 200 <= int(code2) < 300:
        print(f"Updated release id {release_id}")
        return True
    else:
        eprint(f"Failed to patch release: HTTP {code2} - {body2}")
        return False


def main():
    badge = os.environ.get("VERSIONS_BADGE_URL")
    if not badge:
        eprint("Environment variable VERSIONS_BADGE_URL is empty or not set. Nothing to do.")
        sys.exit(0)

    # Only update the latest GitHub release body; do not modify CHANGELOG.md
    marker = "<!-- badge -->"

    github_token = os.environ.get("GH_TOKEN")
    github_repo = os.environ.get("GITHUB_REPOSITORY")
    if not (github_token and github_repo):
        eprint("GH_TOKEN or GITHUB_REPOSITORY not set; cannot update release")
        sys.exit(2)

    ok = update_latest_release_badge(github_repo, github_token, marker, badge)
    if not ok:
        eprint("Failed to update latest GitHub release")
        sys.exit(3)

    print("Updated latest GitHub release with versions badge")


if __name__ == "__main__":
    main()
