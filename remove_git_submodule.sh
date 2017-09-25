#!/usr/bin/env bash

# $1 - The relative path to the submodule

# TODO
# Delete the relevant section from the .gitmodules file.

# Stage the .gitmodules changes git add .gitmodules
git add .gitmodules

# TODO
# Delete the relevant section from .git/config.

# Run git rm --cached path_to_submodule (no trailing slash).
git rm --cached $1

# Run rm -rf .git/modules/path_to_submodule
rm -rf .git/modules/$1

# Commit git commit -m "Removed submodule <name>"
git commit -m "remove submodule $1"

# Delete the now untracked submodule files
rm -rf $1

