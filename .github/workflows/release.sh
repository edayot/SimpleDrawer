#!/bin/bash
git config --global user.name "github-actions"
git config --global user.email "action@github.com"

# print the version bump
echo "Version bump: $VERSION_BUMP"

if [ "$VERSION_BUMP" = "automatic" ]; then
    poetry run semantic-release -v version
fi
if [ "$VERSION_BUMP" = "patch" ]; then
    poetry run semantic-release -v version --patch
fi
if [ "$VERSION_BUMP" = "minor" ]; then
    poetry run semantic-release -v version --minor
fi
if [ "$VERSION_BUMP" = "major" ]; then
    poetry run semantic-release -v version --major
fi
poetry run semantic-release -v publish